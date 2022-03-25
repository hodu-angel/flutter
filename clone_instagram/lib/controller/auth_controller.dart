import 'package:clone_instagram/repository/user_repository.dart';
import 'package:get/get.dart';

//로그인 체크
class AuthController extends GetxController {
  Future<bool?> loginUser(String uid) async {
    //DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    print(userData);
    return userData;
  }
}
