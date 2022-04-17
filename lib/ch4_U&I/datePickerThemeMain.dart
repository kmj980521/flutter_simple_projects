import 'package:flutter/material.dart';


import 'datePicker.dart';

void mains() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white,
              fontFamily: 'parisienne',
              fontSize: 80
          ),
          headline2: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyText2:TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        )
    ),
    debugShowCheckedModeBanner: false,
    home: UAndI(),
  ));
}