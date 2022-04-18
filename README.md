

## ch-01
- Splash Screen 
- CircularProgressIndicator 사용

-----

## ch-02
- Webview 
- Webview 위젯 사용 

-----

## ch-03
- PictureFrame
- Timer 사용
- PageView 사용
- ThemeData 사용


-----

## ch-04
- DatePicker
- Align 사용 
- DateTime 사용
- CupertinoDatePicker 사용


-----

## ch-05
- RandomNumbers
- Functional Programming 기법 사용 
- Navigator로 값 주고 받기 
- ElevatedButton 사용
- initState() 사용
- Slider 사용

-----


## ch-06
- VideoPlayer 
- video_player 플러그인 사용
- ViedoController 사용
- image_picker 플러그인 사용 (XFile)
- Stack 위젯 사용
- AspectRatio 위젯 사용
- Positioned 위젯 사용 
- File 사용 


- initState(), didUpdateWidget() 사용


-----

## ch-07
- Google Map
   - CameraPosition() 클래스 : 현재 보고 있는 카메라의 위치를 조절할 수 있다


- Google Map 플러그인 사용
   - mapType
   - circle
   - marker 
   - initialCameraPosition

- Geolocator 플러그인 
   - getPositionStream() : 위치 기반으로 스트림 생성 
   - isLocationServiceEnabled() : 위치 권한이 설정되어있는지 체크
   - requestPermission() : 위치 권한 요청 
   - getCurrentPosition() : 현재 위치를 받아온다 
 
 - GoogleMapController 
    - animateCamera : 특정 위도 경도
  
 ```dart
 
 mapController!.animateCamera(CameraUpdate.newLatLng(
  LatLng(                                           
    location.latitude,                              
    location.longitude,                             
  )                                                  
));                                                 
 
 ```
 
- LatLng() 클래스
   - latitude 위도
   - longitude 경도


- **FutureBuilder**
   - future : Future 값을 반환하는 함수(async). 이 함수에서 값을 받아올 때마다 builder를 실행한다
   - builder : future가 실행될 때마다 새로 그릴 위젯
   - AsyncSnapshot : 실행될 때마다 받을 일종의 객체 

- **StreamBuilder**
   - stream : 값을 받아올 Stream
   - builder : stream에서 값을 받아올 때마다 새로 그릴 위젯
   - AsyncSnapshot : 실행될 때마다 받을 일종의 객체

- AlertDialog 위젯
    - async와 await를 사용해 showDialog로 취소 및 확인값을 받아온다
    - Dialog 페이지를 보여줌 
    - title : 제목
    - content : 내용
    - actions : 버튼들 (취소 및 확인 등) 

-----
