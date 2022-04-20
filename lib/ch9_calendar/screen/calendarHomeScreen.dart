import 'package:code_factory/ch9_calendar/component/schedule_card.dart';
import 'package:code_factory/ch9_calendar/constant/colors.dart';
import 'package:flutter/material.dart';

import '../component/calendar.dart';
import '../component/schedule_bottom_sheet.dart';
import '../component/today_banner.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime selectedDay = DateTime(
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
            scheduleCount: 3,
          ),
          SizedBox(height: 8.0),
          _ScheduleList(),

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
              return ScheduleBottomSheet();
            }
        );
      },
      backgroundColor: PRIMARY_COLOR,
      child: Icon(Icons.add),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime foucusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) {
                return SizedBox(height: 8.0,);
              },
              itemBuilder: (context, index) {
                return ScheduleCard(
                    startTime: 8,
                    endTime: 14,
                    content: '프로그래밍 공부하기',
                    color: Colors.red
                );
              })),
    );
  }
}
