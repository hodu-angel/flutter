import 'package:clone_instagram/components/image_data.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
          //선택시 위로 올라가는 것을 고정
          type: BottomNavigationBarType.fixed,
          //label 없애기
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 0,
          elevation: 0,
          onTap: (value){},
          items: [
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.searchOff),
              activeIcon: ImageData(IconsPath.searchOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.uploadIcon),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.activeOff),
              activeIcon: ImageData(IconsPath.activeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              label: 'home',
            ),
          ],
        ),
      ),
      onWillPop: () async {
        //false이면 닫지 않겠다.
        return false;
      },
    );
  }
}
