import 'package:flutter/cupertino.dart';

class CountControllerWithProvider extends ChangeNotifier{
  int count = 0;
  void increase(){
    count++;
    //notifyListeners를 호출하면 업데이트가 된다.
    notifyListeners();
  }
}