import 'package:flutter/material.dart';

void main() {
  runApp(const Camera());
}

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //우측상단 debug제거
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _valueList = ['금호동1가', '금호동2가', '금호동3가'];
  String _value = '금호동3가';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: DropdownButton<String>(
          value: _value,
          icon: Icon(Icons.keyboard_arrow_down),
          underline: Container(),
          items: _valueList.map(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: 150,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'camera.jpeg',
                width: 150,
              ),
              flex: 3,
            ),

            //우측 상품정보
            Expanded(
              child: Container(
                //폭을 %로 줄 수 있다.
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '성동구 청담동 끌올 10분 전',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('210,000원'),

                    //글자나 아이콘은 자기 크기만큼의 사이즈를 가지려 한다.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text('4'),
                      ],
                    ),
                  ],
                ),
              ),
              flex: 7,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
