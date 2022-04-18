import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapGoogle extends StatefulWidget {
  const MapGoogle({Key? key}) : super(key: key);

  @override
  State<MapGoogle> createState() => _MapGoogleState();
}

class _MapGoogleState extends State<MapGoogle> {

  bool choolCheckDone = false;
  GoogleMapController? mapController;

  static final LatLng companyLatLng = LatLng(37.2748, 126.9347);

  static final CameraPosition initialPosition = CameraPosition(
      target: companyLatLng,
  zoom: 15);

  static final double okDistance= 100;

  static final Circle withinDistanceCircle = Circle(
    circleId: CircleId('withinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.blue.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.blue,
    strokeWidth: 1,
  );
  static final Circle notwithinDistanceCircle = Circle(
    circleId: CircleId('notwithinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.red.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.red,
    strokeWidth: 1,
  );
  static final Circle checkDoneCircle = Circle(
    circleId: CircleId('checkDoneCircle'),
    center: companyLatLng,
    fillColor: Colors.green.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.green,
    strokeWidth: 1,
  );
  static final Marker marker = Marker(
    markerId: MarkerId('markder'), // ID
    position: companyLatLng, // 위치
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:renderAppBar(),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }

          if(snapshot.data == '위치 권한이 허가되었습니다.'){
            return StreamBuilder<Position>(
              stream: Geolocator.getPositionStream(),
              builder: (context, snapshot) {
                bool isWithinRange = false;

                if(snapshot.hasData){
                  final start = snapshot.data!; // 내 위치
                  final end = companyLatLng;

                  final distance = Geolocator.distanceBetween(
                      start.latitude,
                      start.longitude,
                      end.latitude,
                      end.longitude
                  );
                  if(distance <okDistance){
                    isWithinRange = true;
                  }
                }


                return Column(
                  children: [
                    _CustomGoogleMap(
                      circle: choolCheckDone ? checkDoneCircle
                          : isWithinRange
                          ? withinDistanceCircle
                          : notwithinDistanceCircle,
                      marker: marker,
                      initialPosition: initialPosition,
                      onMapCreated: onMapCreated,
                    ),

                    _ChoolCheckButton(
                      isWithinRange: isWithinRange,
                      choolCheckDone : choolCheckDone,
                      onPressed: onChoolCheckPressed,
                    ),
                  ],
                );
              }
            );
          }
          return Center(
            child:  Text(snapshot.data),
          );
        },
      ),
    );
  }

  onMapCreated(GoogleMapController controller){  // 맵 생성시 컨트롤러를 생성한다.
     mapController = controller;
  }

  onChoolCheckPressed()async{
    final result = await showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Text('출근하기'),
            content: Text('출근을 하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                },
                child: Text('취소'),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop(true);
                },
                child: Text('출근하기'),
              ),
            ],
          );
        }
    );
    if(result){
      setState(() {
        choolCheckDone = true;
      });
    }
  }

  Future<String> checkPermission() async{
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isLocationEnabled)
    {
      return '위치 서비스를 활성화 해주세요.';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission(); //-> 현재 앱이 갖고 있는 권한을 얻음

    if(checkedPermission == LocationPermission.denied){
      checkedPermission = await Geolocator.requestPermission();

      if(checkedPermission == LocationPermission.denied){
        return '위치 권한을 허가해주세요.';
      }
    }

    if(checkedPermission == LocationPermission.deniedForever){
      return '앱의 위치 권한을 세팅에서 허가해주세요.';
    }

    return '위치 권한이 허가되었습니다.';

  }


  AppBar renderAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,

      title: Text('오늘도 출근',style: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w700,
      ),),
      actions: [
        IconButton(
            onPressed: () async {
              if(mapController ==null){
                return;
              }
              final location = await Geolocator.getCurrentPosition();   // 현재 위치 정보를 한 번만 받아온다.
              mapController!.animateCamera(CameraUpdate.newLatLng(
                LatLng(
                  location.latitude,
                  location.longitude,
                )
              ));
            },
            color: Colors.blue,
            icon: Icon(Icons.my_location),
      )],
    );
  }
}
class _CustomGoogleMap extends StatelessWidget {
  final MapCreatedCallback onMapCreated;

  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;
  const _CustomGoogleMap({
    required this.initialPosition,
    required this.circle,
    required this.marker,
    required this.onMapCreated,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        circles: Set.from([circle]),
        markers: Set.from([marker]),
        onMapCreated: onMapCreated,
      ),
    );
  }
}

class _ChoolCheckButton extends StatelessWidget {

  final bool isWithinRange;
  final VoidCallback onPressed;
  final bool choolCheckDone;

  

  const _ChoolCheckButton({
    required this.isWithinRange,
    required this.onPressed,
    required this.choolCheckDone,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timelapse_outlined,
              size: 50.0,
              color: choolCheckDone ? Colors.green : isWithinRange? Colors.blue : Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
            if(!choolCheckDone && isWithinRange)
              TextButton(
                onPressed: onPressed,
                child: Text('출근하기'),
            ),
          ],
        )
    );
  }
}
