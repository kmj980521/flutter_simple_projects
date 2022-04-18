import 'package:code_factory/navigator/screen/route_one_screen.dart';
import 'package:code_factory/navigator/screen/route_three_screen.dart';
import 'package:code_factory/navigator/screen/route_two_screen.dart';
import 'package:flutter/material.dart';

import '../ch1_splash_screen/homeScreen.dart';


void main() {
  runApp(
    MaterialApp(
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/one' : (context) => RouteOneScreen(),
        '/two' : (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
