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

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  final _valueList = ['금호동1가', '금호동2가', '금호동3가'];
  String _value ='금호동3가';

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

          },).toList(),

          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black,),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black,),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black,),
            onPressed: (){},
          ),
        ],
      ),
      body: Text(''),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}