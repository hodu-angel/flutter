import 'package:uuid/uuid.dart';

class Datautil{
  //file 이름은 uuid로 사용하는것이 좋다. 중복될수도 있고 사람끼리 전달하기에.
  static String makeFilePath(){
    //확장자도 받아와야 된다.
    return '${Uuid().v4()}.jpg';
  }
}