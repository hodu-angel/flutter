## initialBinding
- getX를 통한 상태관리.
- main.dart에서 initialBinding: InitBinding()으로 App 실행 동시에 getX controller들을 필요에 따라 Instance를 올려주기 위한 class생성
<br>

---

- init_binding.dart
```
import 'package:clone_instagram/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies(){
    //앱종료시까지 instance가 계속 살아있게 한다.
    Get.put(BottomNavController(), permanent: true);
  }
}
```
<br>

- bottom_nav_controller.dart
```
import 'package:get/get.dart';

//bottom에 있는 pageIndex를 관리할 것임
class BottomNavController extends GetxController{
  RxInt pageIndex = 0.obs;
}
```