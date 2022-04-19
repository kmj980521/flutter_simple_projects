import 'package:flutter/material.dart';

class StreamHomeScreen extends StatefulWidget {
  const StreamHomeScreen({Key? key}) : super(key: key);

  @override
  State<StreamHomeScreen> createState() => _StreamHomeScreenState();
}

class _StreamHomeScreenState extends State<StreamHomeScreen> {

  final textStyle = TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<int>(
          stream: streamNumbers(),
          builder: (context, AsyncSnapshot<int> snapshot) {



            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'StreamBuilder',
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
  Stream<int> streamNumbers() async*{
    for(int i=0;i<10;i++){
      await Future.delayed(Duration(seconds: 1));

      yield i;
    }
  }
}