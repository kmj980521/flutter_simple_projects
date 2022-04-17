import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UAndI extends StatefulWidget {
  const UAndI({Key? key}) : super(key: key);

  @override
  State<UAndI> createState() => _UAndIState();
}

class _UAndIState extends State<UAndI> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child:Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }
  onHeartPressed(){
    final DateTime now = DateTime.now();
      //dialog
      showCupertinoDialog(context: context, barrierDismissible: true, builder: (BuildContext context){
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate, // 초기 Date Time. DatePicker가 처음 실행됐을 때 초기 설정 값
              maximumDate: DateTime(
                  now.year,
                  now.month,
                  now.day
              ), //최대 날짜 설정 값
              onDateTimeChanged: (DateTime date){
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
        );
      });
    }
}


class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, required this.onPressed, Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('U&I',style: theme.textTheme.headline1,),
          Column(
            children: [
              Text('우리 처음 만난날',style:textTheme.bodyText1),
              Text('${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',style: textTheme.bodyText2,),
            ],
          ),

          IconButton(
            iconSize: 60,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text('D+${
            DateTime(
              now.year,
              now.month,
              now.day,
            ).difference(selectedDate).inDays + 1
          }',style: textTheme.headline2,)
        ],
      ),
    );
  }
}


class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png',));
  }
}
