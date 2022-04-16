import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'ch1_splash_screen/homeScreen.dart';
import 'ch2_webview/webView.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: webViewScreen(),
  ));
}



