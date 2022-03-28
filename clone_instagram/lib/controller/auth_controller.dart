import 'package:clone_instagram/models/instagram_user.dart';
import 'package:clone_instagram/repository/user_repository.dart';
import 'package:get/get.dart';

//AuthController는 이 앱을 통틀어서 User정보가 들어있는 class이다.
class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<IUser> user = IUser().obs;

  //로그인 체크
  Future<IUser?> loginUser(String uid) async {
    //DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  void signup(IUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if(result){
      //로그인 성공
      user(signupUser);
    }
  }
}
