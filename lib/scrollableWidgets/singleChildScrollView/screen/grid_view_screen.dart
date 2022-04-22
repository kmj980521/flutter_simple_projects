import 'package:code_factory/scrollableWidgets/constant/colors.dart';
import 'package:code_factory/scrollableWidgets/singleChildScrollView/layout/main_layout.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);

  GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MainLayout(
      title: 'GridViewScreen',
      body: renderBuilderMaxCrossAxisExtend(),
    );
  }

  // 1.
  // 한 번에 모든 위젯을 그림
  Widget renderCount() {
    return GridView.count(
      // 좌에서 우로 view의 갯수
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: numbers
          .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
    );
  }

  // 2.
  // 보아는 것만 새로 그림
  Widget renderBuilderCrossAxisCount(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }
  // 3.
  // 최대 사이즈를 조절
  Widget renderBuilderMaxCrossAxisExtend(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // 하나하나의 최대 길이
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
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
