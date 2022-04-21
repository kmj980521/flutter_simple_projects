import 'package:code_factory/ch9_calendar/component/schedule_card.dart';
import 'package:code_factory/ch9_calendar/constant/colors.dart';
import 'package:code_factory/ch9_calendar/model/schedule_with_color.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../component/calendar.dart';
import '../component/schedule_bottom_sheet.dart';
import '../component/today_banner.dart';
import '../datebase/drift_database.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime selectedDay = DateTime.utc(
      DateTime
          .now()
          .year,
      DateTime
          .now()
          .month,
      DateTime
          .now()
          .day
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:renderFloatingActionButton(),
      body: Column(
        children: [
          Calendar(
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(height: 8.0,),
          TodayBanner(
            selectedDay: selectedDay,
          ),
          SizedBox(height: 8.0),
          _ScheduleList(selectedDate: selectedDay,),

        ],
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_){
              return ScheduleBottomSheet(selectedDate: selectedDay,);
            }
        );
      },
      backgroundColor: PRIMARY_COLOR,
      child: Icon(Icons.add),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime foucusedDay) { // UTC 기준으로 값이 넣어줌
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  final DateTime selectedDate;
  const _ScheduleList({required this.selectedDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: StreamBuilder<List<ScheduleWithColor>>(
            stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasData && snapshot.data!.isEmpty){
                return Center(child: Text('스케줄이 없습니다'),);
              }

              return ListView.separated(
                padding: EdgeInsets.zero,
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8.0,);
                  },
                  itemBuilder: (context, index) {
                    final scheduleWitchColor = snapshot.data![index];

                    return Dismissible(
                      key: ObjectKey(scheduleWitchColor.schedule.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction){
                        GetIt.I<LocalDatabase>().removeSchedule(scheduleWitchColor.schedule.id);
                      },
                      child: GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_){
                                return ScheduleBottomSheet(
                                  selectedDate: selectedDate,
                                  scheduleId: scheduleWitchColor.schedule.id,
                                );
                              }
                          );
                        },
                        child: ScheduleCard(
                            startTime: scheduleWitchColor.schedule.startTime,
                            endTime: scheduleWitchColor.schedule.endTime,
                            content: scheduleWitchColor.schedule.content,
                            color: Color(
                              int.parse('FF${scheduleWitchColor.categoryColor.hexCode}',radix: 16)
                            ),
                        ),
                      ),
                    );
                  });
            }
          )),
    );
  }
}
