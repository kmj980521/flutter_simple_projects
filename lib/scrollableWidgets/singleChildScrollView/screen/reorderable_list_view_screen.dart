import 'package:code_factory/scrollableWidgets/singleChildScrollView/layout/main_layout.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ReorderableListViewScreen',
      body: ReorderableListView.builder(
          itemBuilder: (context, index){
            return renderContainer(color: rainbowColors[numbers[index] % rainbowColors.length], index: numbers[index]);
          },
          itemCount: numbers.length,
          onReorder: (int oldIndex,int newIndex){
            setState(() {

              if(oldIndex < newIndex){ // case 1)
                newIndex -=1;
              }

              final item = numbers.removeAt(oldIndex);
              numbers.insert(newIndex,item);
            });
          }
      ),
    );
  }
  Widget renderDefault(){
    return  ReorderableListView(
      // 한 번에 다 그려진다
      children: numbers
          .map((e) => renderContainer(
          color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
      onReorder: (int oldIndex,int newIndex){
        // oldIndex와 newIndex는 옮기기 전에 값을 산정한다
        setState(() {
          // case1)
          // [red, orange, yellow]
          // [0, 1, 2]
          // red를 yellow 다음으로 옮기고 싶다.
          // red: 0 oldIndex -> 3 newIndex
          // [orange, yello, red]

          // case2)
          // [red, orange, yellow]
          // [0, 1, 2]
          // yellow를 맨 앞으로 옮기고 싶다.
          // yellow : 2 oldIndex -> 0 new Index
          // [yellow, red, orange]
          if(oldIndex < newIndex){ // case 1)
            newIndex -=1;
          }

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex,item);
        });
      },
    );
  }
  Widget renderContainer(
      {required Color color, required int index, double? height}) {
    return Container(
      key: Key(index.toString()),
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
