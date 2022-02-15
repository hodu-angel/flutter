import 'package:clone_instagram/pages/upload.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

//bottom에 있는 pageIndex를 관리할 것임
class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
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

  //같은 pageIndex가 포함되어있으면 제거하고 새로 추가한다.
  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    print('addPage ${bottomHistory}');
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      print('exit!');
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
