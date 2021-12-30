import 'package:flutter/material.dart';

void main() {
  runApp(const listviewEx());
}

class listviewEx extends StatelessWidget {
  const listviewEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Container(
              width: 300,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                      child: Icon(Icons.account_circle_rounded, size: 50,)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text('홍길동', style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                      child: Icon(Icons.account_circle_rounded, size: 50,)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text('홍길동', style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                      child: Icon(Icons.account_circle_rounded, size: 50,)
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text('홍길동', style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomApp(),
      ),
    );
  }
}

//CustomWidget
class BottomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.phone),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.message),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.contact_page),
          ),
        ],
      ),
    );
  }
}
