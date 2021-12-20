import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text('앱임') ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 150, height: 50,
            //박스 꾸미기
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
            ),
            //박스 위치 여백주기
            margin: EdgeInsets.all(30),
            //박스 내의 여백주기
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('padding'),
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
