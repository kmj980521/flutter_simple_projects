

## ch-01 Splash Screen 

### 1. CircularProgressIndicator 사용

-----

## ch-02 Webview 
 
### 1. Webview 위젯 사용 

-----

## ch-03 PictureFrame
 
### 1. Timer 사용
### 2. PageView 사용
### 3. ThemeData 사용


-----

## ch-04 DatePicker

### 1. Align 사용 
### 2. DateTime 사용
### 3. CupertinoDatePicker 사용


-----

## ch-05 RandomNumbers
 
### 1. Functional Programming 기법 사용 
### 2. Navigator로 값 주고 받기 
### 3. ElevatedButton 사용
### 4. initState() 사용
### 5. Slider 사용

-----


## ch-06 VideoPlayer 
 
### 1. video_player 플러그인 사용
### 2. ViedoController 사용
### 3. image_picker 플러그인 사용 (XFile)
### 4. Stack 위젯 사용
### 5. AspectRatio 위젯 사용
### 6. Positioned 위젯 사용 
### 7. File 사용 


### 8. initState(), didUpdateWidget() 사용


-----

## ch-07 Google Map

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

-----

## ch-09 Calendar 

### 1. SQLite 플러그인 사용

### 2. Drift 패키지(SQLite ORM) 사용

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
           
### 8. IntrinsicHeight 위젯

- Row를 IntrinsicHeight로 감싸고, crossAxisAlignment를 stretch 하면 Row 내에서 가장 높은 위젯이 차지하고 있는 높이 만큼 stretch를 할 수 있다.


### 9. ListView 위젯
- itemCount : 그릴 아이템 수
- itemBuilder : (context, index) { return 위젯 }
- 봐야하는 인덱스까지 scrolling을 하고난 후에 다른 아이템을 보려고 할 때 위젯을 그린다. --> 메모리 관리에 유리하다

  - LiseView.separated() 위젯
    - 일반 ListView.builder와 같고, separatorBuilder : --> 한 위젯을 그리고나서 또 다른 위젯을 그릴 때. 즉, 위젯과 위젯 사이에 무언가를 그릴 때 사용

### 10. showModalBottomSheet()
 - BottomeSheet를 보여준다

### 11. Wrap 위젯
- Row로 했을 때는 overflow가 날 수 있으니 자동으로 줄바꿈 mapping을 해준다
- spacing : 각각 child 사이에 양 옆으로 간격을 준다 
- runSpacing : 각각 child 위아래로 간격을 준다 
