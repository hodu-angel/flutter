import 'package:clone_instagram/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

//앱 실행동시에 getx controller들을 필요에 따라 instance를 올려주기 위한 class
class InitBinding extends Bindings{
  @override
  void dependencies(){
    //앱종료시까지 instance가 계속 살아있게 한다.
    Get.put(BottomNavController(), permanent: true);
  }
}