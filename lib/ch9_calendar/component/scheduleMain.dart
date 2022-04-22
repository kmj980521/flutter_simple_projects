import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';


import '../datebase/drift_database.dart';
import '../screen/calendarHomeScreen.dart';

import 'package:intl/date_symbol_data_local.dart';

const DEFAULT_COLORS = [
  'F44336', // 빨강
  'FF9800', // 주황
  'FFEB3B', // 노랑
  'FCAF50', // 초록
  '2196F3', // 파랑
  '3F51B5', // 남색
  '9C27B0'  // 보라
];

void mains() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter Framework가 준비될 때까지 기다린다.

  await initializeDateFormatting();

  final database = LocalDatabase();
  // .I -> 인스턴스
  GetIt.I.registerSingleton<LocalDatabase>(database);

  final colors = await database.getCategoryColors();

  if (colors.isEmpty) {
    for (String hexCode in DEFAULT_COLORS) {
      await database.createCategoryColor(
        CategoryColorsCompanion(
          hexCode: Value(hexCode),
        ),
      );
    }
  }
}

/*
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'NotoSans'
    ),
    debugShowCheckedModeBanner: false,
    home: MyCalendar(),
  ));
}

*/

