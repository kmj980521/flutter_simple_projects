import 'package:code_factory/scrollableWidgets/singleChildScrollView/layout/main_layout.dart';
import 'package:code_factory/scrollableWidgets/singleChildScrollView/screen/custom_scroll_view.dart';
import 'package:code_factory/scrollableWidgets/singleChildScrollView/screen/single_child_scroll_view_screen.dart';
import 'package:flutter/material.dart';

import 'grid_view_screen.dart';
import 'list_view_screen.dart';
import 'refresh_indicator.dart';
import 'reorderable_list_view_screen.dart';
import 'scrollbar_screen.dart';

class ScreenModel {
  final WidgetBuilder  builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name
  });
}

class singleChildHomeScreen extends StatelessWidget {
  final screens = [
    ScreenModel(builder: (_)=> SingleChildScrollViewScreen(), name: 'SingleChildScrollViewScreen'),
    ScreenModel(builder: (_)=> ListViewScreen(), name: 'ListViewScreen'),
    ScreenModel(builder: (_)=> GridViewScreen(), name: 'GridViewScreen'),
    ScreenModel(builder: (_)=> ReorderableListViewScreen(), name: 'ReorderableListViewScreen'),
    ScreenModel(builder: (_)=> CustomScrollviewScreen(), name: 'CustomScrollviewScreen'),
    ScreenModel(builder: (_)=> ScrollbarScreen(), name: 'ScrollbarScreen'),
    ScreenModel(builder: (_)=> RefreshIndicatorScreen(), name: 'RefreshIndicatorScreen'),

  ];
   singleChildHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Home',
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: screens.map(
                      (screen) => ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:screen.builder,
                            ),
                          );
                        },
                        child: Text(screen.name),
                      )
              ).toList(),
            ),
          ),
        ));
  }
}
