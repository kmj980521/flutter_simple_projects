import 'package:code_factory/scrollableWidgets/constant/colors.dart';
import 'package:code_factory/scrollableWidgets/singleChildScrollView/layout/main_layout.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: renderDefault(),
    );
  }
  // 1. 매핑
  // 100개가 한 번에 그려진다
  Widget renderDefault() {
    return ListView(
      children: numbers
          .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
    );
  }

  // 2. builder
  // 화면을 벗어날 때 위젯을 그려 퍼포먼스적으로 유리하다다
  Widget renderBuilder(){
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length],
              index: index);
        }
    );
  }

  // 3. separated
  // 위젯과 위젯 사이 새로운 위젯을 자동으로 만들어준다
  Widget renderSeparated(){
    return ListView.separated(
        separatorBuilder: (context, index){
          // 5개의 item마다 배너 보여주기
          index +=1 ;
          if(index % 5 == 0)
          {
            return renderContainer(
              color: Colors.black,
              index: index,
              height: 100,
            );
          }
          return Container();

        },
        itemCount: 100,
        itemBuilder: (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,

          );
        }
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
