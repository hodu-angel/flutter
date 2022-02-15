import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

//bottom에 있는 pageIndex를 관리할 것임
class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  //pageIndex에 각 해당하는 event처리를 여기 method에서 함
  void changeBottomNav(int value) {
    //pageIndex에 해당하는 enum값을 가져오게 된다.
    var page = PageName.values[value];
    switch(page){
      case PageName.HOME:
        _changePage(value);
        break;
      case PageName.SEARCH:
        _changePage(value);
        break;
      case PageName.UPLOAD: //page전환이 아니고 popUp으로 떠야된다.
        break;
      case PageName.ACTIVITY:
        _changePage(value);
        break;
      case PageName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value){
    pageIndex(value);
  }
}
