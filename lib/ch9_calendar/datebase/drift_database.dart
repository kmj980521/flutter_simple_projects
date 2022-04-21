import 'dart:io';

import 'package:code_factory/ch9_calendar/model/category_color.dart';
import 'package:code_factory/ch9_calendar/model/schedule_with_color.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../model/schedule.dart';

part 'drift_database.g.dart';

// 데코레이터 사용
@DriftDatabase(
  tables: [
    Schedules, //타입만 넣어준다.
    CategoryColors,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<Schedule> getScheduleById(int id)=>
      (select(schedules)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<int> createSchedule(SchedulesCompanion data) => into(schedules).insert(data); //id 값(PRIMARY KEY)을 반환을 받는다.

  Future<int> createCategoryColor(CategoryColorsCompanion data) => into(categoryColors).insert(data);

  Future<List<CategoryColor>> getCategoryColors() =>
      select(categoryColors).get();

  Future<int> updateScheduleById(int id, SchedulesCompanion data)=>
      (update(schedules)..where((tbl)=>tbl.id.equals(id))).write(data);

  Future<int> removeSchedule(int id) => (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  Stream<List<ScheduleWithColor>> watchSchedules(DateTime date) {
    final query = select(schedules).join([
      innerJoin(categoryColors, categoryColors.id.equalsExp(schedules.colorId))
    ]);
    query.where(schedules.date.equals(date));
    query.orderBy(
      [
        OrderingTerm.asc(schedules.startTime),
      ]
    );
    return query.watch().map(
            (rows) => rows.map(
                (row) => ScheduleWithColor(
                    schedule: row.readTable(schedules),
                    categoryColor: row.readTable(categoryColors)
                )
            ).toList()
    );

    //return (select(schedules)..where((tbl)=>tbl.date.equals(date))).watch();
  }




   // final query = select(schedules);
   // query.where((tbl)=> tbl.date.equals(date));
   // return query.watch();





  @override
  int get schemaVersion => 1;
}

// DB 생성 코드
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory(); //앱 실행 폴더 위치
    final file =
        File(p.join(dbFolder.path, 'db.sqlite')); // 현재 애플리케이션에 배정된 경로 위치);
    return NativeDatabase(file);
  });
}
