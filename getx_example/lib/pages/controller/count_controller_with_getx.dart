import 'package:get/get.dart';

//provider와 사용방법은 동일하지만 Getx에서는 GetxController를 사용한다.
class CountControllerWithGetx extends GetxController{
  int count = 0;
  void increase(){
    count++;
    update();
  }
}