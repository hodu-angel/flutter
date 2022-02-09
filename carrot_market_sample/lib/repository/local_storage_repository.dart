import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageRepository{
  final storage = FlutterSecureStorage();

  //storage에는 String값으로 저장이 된다.
  //객체를 저장해도 되는데 json형태로 String으로 만들어 저장을 시키고 String으로 불러들인다.
  //읽어오기
  Future<String?> getStorageValue(String key) async{
    try{
      return await storage.read(key: key);
    } catch(error){
      //예외처리는 생략함
      return null;
    }
  }

  //저장
  Future<void> storeValue(String key, String value) async{
    try{
      return await storage.write(key: key, value: value.toString());
    } catch(error){
      //예외처리는 생략함
      return null;
    }
  }
}