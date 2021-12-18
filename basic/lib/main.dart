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
            body: Text('안녕'),
            bottomNavigationBar: BottomAppBar(
                //width, height, child만 필요한 박스는 SizedBox() 를 사용함
                child: SizedBox(  //Container는 무겁기때문에 SizedBox가 더 가벼워서 Lint가 잡아준다.
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.phone),
                      Icon(Icons.message),
                      Icon(Icons.contact_page),
                ],
              ),
            )
            )
        )
    );
  }
}
