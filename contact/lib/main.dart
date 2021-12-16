import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        home: Center(
            child: Container( width: 50, height: 50, color: Colors.blue),
        )
    );
  }
}

