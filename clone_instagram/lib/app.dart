import 'package:clone_instagram/components/image_data.dart';
import 'package:clone_instagram/controller/bottom_nav_controller.dart';
import 'package:clone_instagram/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              //Container(child: Center(child: Text('HOME')),),
              Container(child: Center(child: Text('SEARCH')),),
              Container(child: Center(child: Text('UPLOADE')),),
              Container(child: Center(child: Text('ACTIVITY')),),
              Container(child: Center(child: Text('MYPAGE')),),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            //선택시 위로 올라가는 것을 고정
            type: BottomNavigationBarType.fixed,
            //label 없애기
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.uploadIcon),
                label: 'upload',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label: 'activity',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                label: 'mypage',
              ),
            ],
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
