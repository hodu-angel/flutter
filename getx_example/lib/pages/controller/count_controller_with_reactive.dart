import 'package:get/get.dart';

//extends를 하지않고 하나하나의 stream을 넣는다.
class CountControllerWithReactive{
  //obs는 반응형으로 관리를 해준다는 것이다.
  RxInt count = 0.obs;
  //changeNotified나 update를 하지않아도 스스로가 바로 반응형상태관리가 된다.
  void increase(){
    count++;
  }
}