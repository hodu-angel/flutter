import 'dart:io';

import 'package:clone_instagram/components/message_popup.dart';
import 'package:clone_instagram/pages/upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

//bottom에 있는 pageIndex를 관리할 것임
class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNaviationKey = GlobalKey<NavigatorState>();
  List<int> bottomHistory = [0]; //검색이나 다른버튼을 누르고 뒤로가기시 홈으로 가게하기 위함

  //pageIndex에 각 해당하는 event처리를 여기 method에서 함
  void changeBottomNav(int value, {bool hasGesture = true}) {
    //pageIndex에 해당하는 enum값을 가져오게 된다.
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD: //page전환이 아니고 popUp으로 떠야된다.
        Get.to(() => const Upload());
        break;
      //동일하게 _changePage가 들어가니, 한번에 처리하도록 마지막에 한줄로 표현함
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  //현재페이지가 List의 마지막에 추가되있는경우 pageIndex를 더이상추가하지않는다.
  //현재페이지가 List의 마지막과 다를경우 pageIndex를 추가한다.
  //ex) [0, 1, 2, 1, 0]
  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
    // if (bottomHistory.contains(value)) {
    //   bottomHistory.remove(value);
    // }
    print('addPage ${bottomHistory}');
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      print('exit!');
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
              title: '시스템',
              message: '종료하시겠습니까?',
              okCallback: () {
                exit(0);
              },
            cancelCallback: Get.back,
          ),
      );
      return true;
    } else {
      print('goto before apge!');
      bottomHistory.removeLast();
      //제거됐으면 changeBottomNav로 보내서 페이지전환되게 한다.
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);

      //제거됐는지 확인
      print('removePage ${bottomHistory}');
      return false;
    }
  }
}
