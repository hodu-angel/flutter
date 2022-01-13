import 'package:carrot_market_sample/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bodyWidget(){
    switch(_currentPageIndex){
      case 0:
        return Home();
        break;
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        return Container();
        break;
    }
    return Container();
  }
  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label){
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset('assets/svg/${iconName}_off.svg', width: 22,),
        ),
        //선택된 아이콘 색들어오게 함
        activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset('assets/svg/${iconName}_on.svg', width: 22,),
        ),
        label: label,
    );
  }

  Widget _bottomNavigationBarwidget(){
    return BottomNavigationBar(
      //선택시 좌측아이콘을 밀고 확대되는 애니메이션 효과를 확대애니메이션으로 고정시킴
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      //클릭시 글씨사이즈 조절
      selectedFontSize: 12,
      currentIndex: _currentPageIndex,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black),
      items: [
        _bottomNavigationBarItem('home', '홈'),
        _bottomNavigationBarItem('notes', '동네생활'),
        _bottomNavigationBarItem('location', '내 근처'),
        _bottomNavigationBarItem('chat', '채팅'),
        _bottomNavigationBarItem('user', '나의 당근'),
      ],
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }
}
