import 'dart:math';

import 'package:code_factory/scrollableWidgets/constant/colors.dart';
import 'package:flutter/material.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {

  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });


  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // 최대 높이
  double get maxExtent => maxHeight;

  @override
  // 최소 높이
  double get minExtent => minHeight;

  // covariant - 상속된 클래스도 사용가능
  // oldDelegate - build가 실행이 됐을 때 이전 Delegate
  // this - 새로운 delegate
  // shouldRebuild - 새로 build를 해야할지 말지 결정
  // false - build 안함 / true - 빌드 다시 함
  @override
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }

}


class CustomScrollviewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          renderHeader(),
          renderBuilderSliverList(),
          renderHeader(),
          renderSliverGridBuilder(),
          renderBuilderSliverList(),
        ],
      ),
    );
  }

  SliverPersistentHeader renderHeader(){
    return SliverPersistentHeader(
      // pinned를 사용하여 headr가 쌓이듯이 구현할 수 있음
      pinned: true, 
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text('신기하지', style: TextStyle(
                color: Colors.white,
                fontSize: 30.0
            ),),
          ),
        ),
        maxHeight: 150 ,
        minHeight: 75 ,
      ),
    );
  }

  // AppBar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      // 스크롤 했을 때 리스트의 중간에도 Appbar가 내려오게 할 수 있다. 기본 값은 false
      floating: true,
      // 스크롤을 해도 Appbar가 고정이 되어 있다. 기본 값은 false
      pinned: false,
      // floating을 true로 해놔야 함. 조금만 움직여도 Appbar가 등장
      snap: true,
      // physics를 사용해서 안드로이드에서 구현. iOS에서는 default로 땡겼을 때 튕기는 애니메이션이기 때문에, true로 해주면 Appbar가 따라온다
      // 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 차지
      stretch: true,
      // 늘어났을 때 최대 사이즈
      expandedHeight: 200,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('FlexibleSpace'),
        background: Image.asset(
          'asset/img/image_1.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  // ListView 기본 생성자와 유사함
  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map((e) =>
            renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList(),
      ),
    );
  }

  // ListView.builder 생성자와 유사
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      }, childCount: 100),
    );
  }

  // GridView.count 유사함
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map((e) =>
            renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // GridView.builder 유사함
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      }, childCount: 100),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
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
