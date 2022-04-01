import 'package:get/get.dart';

class GetxControllerTest extends GetxController{
  static GetxControllerTest get to => Get.find();
  RxInt count = 0.obs;

  void increase(){
    count++;
  }
}