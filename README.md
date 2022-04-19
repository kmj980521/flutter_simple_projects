

## ch-01
- Splash Screen 
### 1. CircularProgressIndicator 사용

-----

## ch-02
- Webview 
### 1. Webview 위젯 사용 

-----

## ch-03
- PictureFrame
### 1. Timer 사용
### 2. PageView 사용
### 3. ThemeData 사용


-----

## ch-04
- DatePicker
### 1. Align 사용 
### 2. DateTime 사용
### 3. CupertinoDatePicker 사용


-----

## ch-05
- RandomNumbers
### 1. Functional Programming 기법 사용 
### 2. Navigator로 값 주고 받기 
### 3. ElevatedButton 사용
### 4. initState() 사용
### 5. Slider 사용

-----


## ch-06
- VideoPlayer 
### 1. video_player 플러그인 사용
### 2. ViedoController 사용
### 3. image_picker 플러그인 사용 (XFile)
### 4. Stack 위젯 사용
### 5. AspectRatio 위젯 사용
### 6. Positioned 위젯 사용 
### 7. File 사용 


### 8. initState(), didUpdateWidget() 사용


-----

## ch-07
- Google Map
   - CameraPosition() 클래스 : 현재 보고 있는 카메라의 위치를 조절할 수 있다


### 1. Google Map 플러그인 사용
   - mapType
   - circle
   - marker 
   - initialCameraPosition

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

## ch-09
- Calendar

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
    - 


### 4. GetIt 패키지 (Dependency Injection)

### 5. Spinkit 패키지 (로딩 위젯)

### 6. Intl 패키지 (다국어화)


### 7. TextField (글자 인풋받기)
