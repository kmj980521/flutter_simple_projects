import 'package:code_factory/scrollableWidgets/singleChildScrollView/layout/main_layout.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class ScrollbarScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ScrollbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ScrollbarScreen',
        body:Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: numbers
                  .map((e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length], index: e))
                  .toList(),
            ),
          ),
        ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height
  }) {
    return Container(
      height: height ?? 300 ,
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
