import 'dart:math';

import 'package:flutter/material.dart';

class FutureHomeScreen extends StatefulWidget {
  const FutureHomeScreen({Key? key}) : super(key: key);

  @override
  State<FutureHomeScreen> createState() => _FutureHomeScreenState();
}

class _FutureHomeScreenState extends State<FutureHomeScreen> {
  final textStyle = TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getNumber(),
          builder: (context, snapshot) {
            if(snapshot.hasData)
            {
              // 데이터가 있을 때 위젯 렌더링
            }

            if(snapshot.hasError){
              //에러가 났을 때 위젯 렌더링
            }

            // 로딩중일 때 위젯 렌더링


            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 20.0),
                ),
                Text(
                  'conState : ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Text('Data : ${snapshot.data}'),
                Text('Error : ${snapshot.error}'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('setState'))
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));
    final random = Random();

    //throw Exception('에러 발생');

    return random.nextInt(100);
  }


}

