import 'package:get/get.dart';

class GetxServiceTest extends GetxService{
  static GetxServiceTest get to => Get.find();
  RxInt count = 0.obs;

  void increase(){
    count++;
  }

  // void clear(){
  //   //Get에 올라온 모든 instance들을 초기화 시키는 것.
  //   Get.reset();
  // }
}