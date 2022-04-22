import 'package:code_factory/scrollableWidgets/constant/colors.dart';
import 'package:code_factory/scrollableWidgets/singleChildScrollView/layout/main_layout.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorScreen extends StatefulWidget {

  RefreshIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorScreen> createState() => _RefreshIndicatorScreenState();
}

class _RefreshIndicatorScreenState extends State<RefreshIndicatorScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'RefreshIndicatorScreen',
        body: RefreshIndicator(
          onRefresh: ()async{
            final List<int> number = List.generate(100, (index) => index+100);
            setState(() {
              numbers = number;
            });
            await Future.delayed(Duration(seconds: 3));

          },
          child: ListView(
              children: numbers
                  .map((e) => renderContainer(
                      color: rainbowColors[e % rainbowColors.length], index: e))
                  .toList()),
        ));
  }

  Widget renderContainer(
      {required Color color, required int index, double? height}) {
    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
