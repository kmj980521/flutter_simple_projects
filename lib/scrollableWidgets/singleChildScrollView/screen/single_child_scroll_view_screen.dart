import 'package:code_factory/scrollableWidgets/singleChildScrollView/layout/main_layout.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderSimple(),
    );
  }

  // 1. 기본 렌더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  // 2. 화면을 넘어가지 않아도 스크롤 되게 하기

  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics - 스크롤 안됨
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  // 3. 위젯이 잘리지 않게 하기
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  // 4. 여러가지 physics 정리
  Widget renderPhysics() {
    return SingleChildScrollView(
      // NeverScrollablePhysics  - 스크롤 안됨
      // AlwaysScrollablePhysics  - 스크롤 됨
      // BouncingScrollPhysics  - iOS 스타일 - 튕기듯이
      // ClampingScrollPhysics - 안드로이드 스타일 - 마지막에 걸리듯이
      physics: ClampingScrollPhysics(),
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  // 5. SingleChildScrollView 퍼포먼스

  Widget renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => renderContainer(
            color: rainbowColors[e % rainbowColors.length],
            index: e,
          ),
        )
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if(index != null){
      print('인덱스');
    }
    return Container(
      height: 300,
      color: color,
    );
  }
}
