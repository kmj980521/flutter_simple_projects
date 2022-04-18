import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'ch1_splash_screen/homeScreen.dart';
import 'ch2_webview/webView.dart';
import 'ch3_picture_frame/pictureFrame.dart';
import 'ch4_U&I/datePicker.dart';
import 'ch5_random_number/screen/randomNumber.dart';
import 'ch6_video_player/screen/videoPlayer.dart';
import 'ch7_googleMap/screen/googleMap.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MapGoogle(),
  ));
}



