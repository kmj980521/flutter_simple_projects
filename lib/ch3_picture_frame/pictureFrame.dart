import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PictureFrame extends StatefulWidget {
  const PictureFrame({Key? key}) : super(key: key);

  @override
  State<PictureFrame> createState() => _PictureFrameState();
}

class _PictureFrameState extends State<PictureFrame> {

  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState(){
    super.initState();

    timer = Timer.periodic(Duration(seconds:3), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = (currentPage +1)%5;

      controller.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 400),
          curve: Curves.linear);
    });
  }

  @override
  void dispose(){
    controller.dispose();
    if(timer!= null){
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body:PageView(
        controller: controller,
        children: [1,2,3,4,5].map((e) => Image.asset(
          'asset/img/image_$e.jpeg',
          fit:BoxFit.cover
        )).toList()
      ),

    );
  }
}
