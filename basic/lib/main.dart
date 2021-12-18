import 'package:flutter/material.dart';

void main() {
  runApp(const Basic());
}

class Basic extends StatelessWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('앱임'),
        ),
        body: Container(
          child: Text('안녕'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page),
            ],
          ),

          ),
        ),
      )
    );
  }
}
