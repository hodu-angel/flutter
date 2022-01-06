import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PreferredSizeWidget _appbarWidget(){
    return AppBar(
      title: GestureDetector(
        onTap: (){
          print('click');
        },
        onLongPress: (){
          print('long pressed:');
        },
        child: Row(
          children: [
            Text('아라동'),
            Icon(Icons.arrow_drop_down, color: Colors.black,),
          ],
        ),
      ),
      //상단바의 아래 그림자효과를 없애고 싶을 때 사용
      //높이라는 뜻
      //1로 주면 실선으로 얇게 나옴
      elevation: 1,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black,),),
        IconButton(onPressed: (){}, icon: Icon(Icons.tune, color: Colors.black,),),
        IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/svg/bell.svg',
              width: 22,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Container(),
      bottomNavigationBar: Container(),
    );
  }
}
