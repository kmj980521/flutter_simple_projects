import 'package:drift/drift.dart';

class Schedules extends Table{
  // 함수를 return하기 때문에 실행하기 위해 ()
  // PRIMARY KEY
  IntColumn get id => integer().autoIncrement()(); // 자동으로 값을 늘려 key로 사용하기 위함

  // 내용
  TextColumn get content =>text()();

  // 일정 날짜
  DateTimeColumn get date => dateTime()();

  //시작 시간
  IntColumn get startTime => integer()();

  //끝 시간
  IntColumn get endTime => integer()();

  // Category Color Table ID
  IntColumn get colorId => integer()();

  // 생성날짜
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now(),)();


}