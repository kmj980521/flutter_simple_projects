# ch-01 Splash Screen 

<details><summary> 내용 보기 
</summary>

### 1. CircularProgressIndicator 사용
 
</details>

- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch1_splash_screen)


-----

# ch-02 Webview 

<details><summary> 내용 보기
</summary>

### 1. Webview 위젯 사용 
 
</details>

 
- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch2_webview)

-----

# ch-03 PictureFrame

<details><summary> 내용 보기
</summary>

### 1. Timer 사용
### 2. PageView 사용
### 3. ThemeData 사용
 
</details>

- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch3_picture_frame)

-----

# ch-04 DatePicker

<details><summary> 내용 보기 
</summary>

### 1. Align 사용 
### 2. DateTime 사용
### 3. CupertinoDatePicker 사용
 
</details>


- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch4_U%26I)


-----

# ch-05 RandomNumbers

<details><summary> 내용 보기
</summary>

### 1. Functional Programming 기법 사용 
### 2. Navigator로 값 주고 받기 
### 3. ElevatedButton 사용
### 4. initState() 사용
### 5. Slider 사용

</details>


- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch5_random_number) 


-----

# ch-06 VideoPlayer 

<details><summary> 내용 보기
</summary>

### 1. video_player 플러그인 사용
### 2. ViedoController 사용
### 3. image_picker 플러그인 사용 (XFile)
### 4. Stack 위젯 사용
### 5. AspectRatio 위젯 사용
### 6. Positioned 위젯 사용 
### 7. File 사용 


### 8. initState(), didUpdateWidget() 사용

</details>


 
- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch6_video_player)


-----

# ch-07 Google Map

<details><summary> 내용 보기
</summary>

### 1. Google Map 플러그인 사용
   - mapType
   - circle
   - marker 
   - initialCameraPosition
   - CameraPosition() 클래스 : 현재 보고 있는 카메라의 위치를 조절할 수 있다

### 2. Geolocator 플러그인 
   - getPositionStream() : 위치 기반으로 스트림 생성 
   - isLocationServiceEnabled() : 위치 권한이 설정되어있는지 체크
   - requestPermission() : 위치 권한 요청 
   - getCurrentPosition() : 현재 위치를 받아온다 
 
### 3. GoogleMapController 
    - animateCamera : 특정 위도 경도
  
 ```dart
 
 mapController!.animateCamera(CameraUpdate.newLatLng(
  LatLng(                                           
    location.latitude,                              
    location.longitude,                             
  )                                                  
));                                                 
 
 ```
 
### 4. LatLng() 클래스
   - latitude 위도
   - longitude 경도


### 5. **FutureBuilder**
   - future : Future 값을 반환하는 함수(async). 이 함수에서 값을 받아올 때마다 builder를 실행한다
   - builder : future가 실행될 때마다 새로 그릴 위젯
   - AsyncSnapshot : 실행될 때마다 받을 일종의 객체 

### 6. **StreamBuilder**
   - stream : 값을 받아올 Stream
   - builder : stream에서 값을 받아올 때마다 새로 그릴 위젯
   - AsyncSnapshot : 실행될 때마다 받을 일종의 객체

### 7. AlertDialog 위젯
    - async와 await를 사용해 showDialog로 취소 및 확인값을 받아온다
    - Dialog 페이지를 보여줌 
    - title : 제목
    - content : 내용
    - actions : 버튼들 (취소 및 확인 등) 
 
 
</details>

- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch7_googleMap)



-----

# ch-09 Calendar 

<details><summary> 내용 보기
</summary>

 ### 1. SQLite 플러그인 사용

### 2. Drift 패키지(SQLite ORM) 사용

- 테이블 생성
```dart

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

```

- 테이블 선언 


```dart

part 'drift_database.g.dart'; 

//데코레이터 사용
@DriftDatabase(
  tables: [
    Schedules, //테이블 타입만 넣어준다.
    CategoryColors,
  ],
)

class LocalDatabase extends _$LocalDatabse{
  LocalDatabase() : super(_openConnection());
}

// DB 생성 코드 
LazyDatabase _openConnection(){
  return LazeDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory(); //앱 실행 폴더 위치
    final file = File(
      p.join(dbFolder.path, 'db.sqlite'),// 현재 애플리케이션에 배정된 경로 위치
    );
    return NativeDatabase(file);
  });
}

```

- part 선언 : 현재 파일의 private 값까지 불러올 수 있고, 이름에 .g.를 포함해 만든다 
- DB에서 값을 읽어올 때 .get()이면 Future, .watch()면 Stream을 반환한다.
- db에서 값을 읽어올 때 **Timezone 시차를 고려한다**

### 3. Table Calendar 패키지 사용
- TableCalendar() 클래스
    - focusedDay : 어느 월을 보여줄 것인지
    - firstDay : 처음 날짜
    - lastDay : 어디까지 보여줄 것인지
    - headerStyle : 상위 header의 style. HearStyle() 클래스를 사용
    - onDaySelected : 어떤 날을 tap 했을 때 실행될 함수
    - selectedDayPredicate : DateTime day를 받아 선택된 날짜가 markered
    - calendarStyle : 캘린더의 style. CalendarStyle() 클래스 사용
       - isTodayHighlighted : 오늘 날짜가 highlighted 해줄지
       - defaultDecoration : 날짜들 container의 Decoration을 BoxDecoration() 클래스로 설정. (주말 제외)
    - outsideDecoration : foucs된 달 이외의 요일들 설정. 만약 이외의 일을 선택해서 캘린더를 옮기고자 할 때는, selectedDay의 값을 focusedDay로 넣어주고 focus를 변경시킨다
    - locale : 언어를 선택. 한국어는 'ko_KR',


### 4. GetIt 패키지 (Dependency Injection)

- `GetIt.I.registerSingleton<LocalDatabase>(database);` : LocalDatabase 타입의 database 인스턴스를 파일 어디에서든 가져올 수 있다. 
` `future : GetIt.I<LocalDatabase>().getCategoryColors()` : LocalDatabase 타입의 인스턴스를 불러온다. 


### 5. Spinkit 패키지 (로딩 위젯)

### 6. Intl 패키지 (다국어화)

- 다국어 지원 패키지

```dart

import 'package:intl/date_symbol_data_local.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized(); // Flutter Framework가 준비될 때까지 기다린다. -> runApp() 코드가 실행되기 전에 코드가 존재한다면 꼭 해줘야 함.

  await initializeDateFormatting(); //언어 포멧팅 형식을 받을 때까지 await. 

  runApp();


```


### 7. TextField (글자 인풋받기)

- 키보드 입력시 시스템적 UI로 가려진 사이즈 구하기 
```dart

final bottomInset = MediaQuery.of(context).viewInsets.bottom;

return  Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height /2 + bottomInset,
      child: Padding(
        padding:  EdgeInsets.only(bottom: bottomInset),
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );

```

- `isScrollControlled: true,` : BottomSheet의 기본 높이는 media height의 절반이기 때문에 이 값을 BottomSheet의 파라미터를 true로 해서 끝까지 올라오게 한다

- `keyboardType: TextInputType.number` : TextField의 타입을 지정


- `FocusScope.of(context).requestFocus(FocusNode());` : 특정 sheet를 GestureDectector로 감싸고, 이 코드를 작성하면 특정 Focus를 벗어날 때 자동으로 키보드를 닫을 수 있다
- `inputFormatters: [ FilteringTextInputFormatter.digitsOnly, ],` : 키보드 입력도 숫자만 가능하게 한다 
- decoration의 InputDecoration()의 suffixText: 접미사
           
### 8. TextFormField 위젯
- TextField 위젯과 비슷
- validator : null이 return 되면 에러가 없다. 에러가 있으면 에러를 String 값으로 리턴해준다.
- 여러 개의 Form을 관리하기 위해선 특정 위젯 상위에다 Form 위젯으로 감싸주면 된다.  
- `onSaved:` : 텍스트 필드를 감싸고 있는 상위에 있는 Form에서 sava라는 함수를 불렀을 때 모든 TextFormField에서 실행된다

#### Form 위젯
 - key : Form의 컨트롤러 
 - `final GlobalKey<FormState> formKey = GlobalKey();` 
 - `if(formKey.currentState!.validate()){} // 모든 테스트 필드에 에러가 없다면 true `
 - `autovalidateMode:AutovalidateMode.always`   : 자동으로 validation 과정을 해준다 
 - `formKey.currentState!.save();` : Form 하위 위젯에서 관리하는 데이터들을 한 번에 저장한다
  
### 9. IntrinsicHeight 위젯

- Row를 IntrinsicHeight로 감싸고, crossAxisAlignment를 stretch 하면 Row 내에서 가장 높은 위젯이 차지하고 있는 높이 만큼 stretch를 할 수 있다.


### 10. ListView 위젯
- itemCount : 그릴 아이템 수
- itemBuilder : (context, index) { return 위젯 }
- 봐야하는 인덱스까지 scrolling을 하고난 후에 다른 아이템을 보려고 할 때 위젯을 그린다. --> 메모리 관리에 유리하다

  - LiseView.separated() 위젯
    - 일반 ListView.builder와 같고, separatorBuilder : --> 한 위젯을 그리고나서 또 다른 위젯을 그릴 때. 즉, 위젯과 위젯 사이에 무언가를 그릴 때 사용

### 11. showModalBottomSheet()
 - BottomeSheet를 보여준다

### 12. Wrap 위젯
- Row로 했을 때는 overflow가 날 수 있으니 자동으로 줄바꿈 mapping을 해준다
- spacing : 각각 child 사이에 양 옆으로 간격을 준다 
- runSpacing : 각각 child 위아래로 간격을 준다 

### 추가 사항
1. `flutter pub run build_runner build` : flutter code generation
2. **.. 키워드** : `number..toString()` -> toString() 되는 대상이 return. number 자체가 return 됨 
3. Dismissible 위젯. 리스트에서 왼쪽 오른쪽으로 swipe 하는 액션을 만들어줄 수가 있다 
 

</details>


- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/ch9_calendar)


 
 ---
 
# ch-10 Scrollable Widgets
 
<details><summary> 내용 보기
</summary>

### 1. ListView 
 - 크기가 무한히 늘어날 수 있다고 가정하기 때문에 상위 위젯에 Column을 두고 Expanded로 감싸서 사용한다. 
 - ListView를 center로 위치해도 shrinkWrap이 false면 가운데에 위치하지 않는다.
 
### 2. SingleChildScrollView
 - pysics : 스크롤 방식
 - clipBehavior : 화면 잘림 정도 
 - 한 번에 모든 위젯을 만들기 때문에 퍼포먼스적으로 좋지 않다.
 
 
### 3. GridView
 
 ##### 1. GridView.count
 - 모든 위젯을 한 번에 모두 그린다.

 ##### 2. GridView.builder
 - gridDelegate : SliverGridDelegateWithFixedCrossAxisCount() : GridView.count와 기능은 비슷하나 내릴 때마다 새로운 위젯을 그려 퍼포먼스를 개선한다.
 
### 4. CustomScrollView
 
- 여러 개의 ScrollView를 사용하는데 따로 스크롤하는 것이 아닌, 한 번에 스크롤 하기 위해서 사용
- slivers : 리스트 형태의 위젯. 이 파라미터 안에 들어가는 위젯들은 앞에 Sliver 가 붙는다
 
 ##### 1. SliverList
 - delegate : SliverChildListDelegate( render 코드 ) / 일반적인 ListView처럼 모든 위젯들이 한 번에 그려진다.
 - SliverChildBuilderDelegate ( (context, index) {return ____} ) / 위젯을 새로 접근할 때 새로 그려주면서 퍼포먼스 개선
 - childCount : 그릴 아이템 수 
 
 ##### 2. SliverGrid
 - 위와 유사 
 
 ###### 3. SliverAppBar
 - floating : 스크롤 했을 때 리스트의 중간에도 Appbar가 내려오게 할 수 있다. 기본 값은 false
 - pinned : 스크롤을 해도 Appbar가 고정이 되어 있다. 기본 값은 false
 - snap : floating을 true로 해놔야 함. 조금만 움직여도 Appbar가 등장
 - stretch : physics를 사용해서 안드로이드에서 구현. iOS에서는 default로 땡겼을 때 튕기는 애니메이션이기 때문에, true로 해주면 Appbar가 따라온다. 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 차지
 - expandedHeight : 늘어났을 때 최대 사이즈
 - collapsedHeight : 최소 사이즈
 - flexibleSpace: 유동적인 화면 구성 
 
 ```dart
 
 flexibleSpace: FlexibleSpaceBar(
                            title: Text('FlexibleSpace'),
                            background: Image.asset('asset/img/image_1.jpeg',
                            fit: BoxFit.cover,),
                          ),
                       // background에 사진을 넣어줄 수도 있다
 
 ```
 
### 5. ReorderableListView
- 화면에서 순서를 바꿔서 보여주는 리스트 
- 기본 constructor는 한 번에 모든 위젯을 다 그린다 
 
- setState()시 주의할 점 
 
 ```dart
 
 
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
 

 ```
 
### 6. RefreshIndicator 
- FaceBook에서 위로 땡겼을 때 나오는 Refresh 위젯
 
- async await를 사용해 서버에서 새로운 데이터를 받아 새로운 화면을 그려낸다.                                  
                                  
 
### 7. SliverPersistentHeader
- Sliver와 Sliver 사이에 Content를 넣어주기 위함

```dart
                                  
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
                                  
```

</details>
 
- [프로젝트 링크](https://github.com/kmj980521/flutter_simple_projects/tree/master/lib/scrollableWidgets/memo)
