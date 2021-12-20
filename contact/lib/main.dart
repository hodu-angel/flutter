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
        //AppBar에는 leading, title, actions 사용가능
        appBar: AppBar(
          leading: Icon(Icons.star),
          title: Text('앱이얌'),
          actions: [Icon(Icons.star), Icon(Icons.shop)],
        ),
        body: SizedBox(
          //button은 기본적으로 child:와 onPressed:가 있어야 잘 보인다.
          child: IconButton(
            icon: Icon(Icons.star),
            onPressed: (){} ,
          ),
        ),
      ),
    );
  }
}
