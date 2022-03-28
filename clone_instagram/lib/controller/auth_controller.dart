import 'dart:io';

import 'package:clone_instagram/models/instagram_user.dart';
import 'package:clone_instagram/repository/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  void signup(IUser signupUser, XFile? thumbnail) async {
    if (thumbnail == null) {
      _submitSignup(signupUser);
    } else {
      var task = uploadXFile(thumbnail,
          '${signupUser.uid}/profile.${thumbnail.path.split('.').last}');
      task.snapshotEvents.listen((event) async {
        print(event.bytesTransferred);
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          //upload를 했을때 image file의 경로 url 를 받아올 수 있다.
          var downloadUrl = await event.ref.getDownloadURL();
          var updatedUserData = signupUser.copyWith(thumbnail: downloadUrl);
          _submitSignup(updatedUserData);
        }
      });
    }
  }

  UploadTask uploadXFile(XFile file, filename) {
    var f = File(file.path);
    //child(폴더경로)
    var ref = FirebaseStorage.instance.ref().child('users').child(filename);
    //users/{uid}/profile.jpg or profile.png로 저장이 될것이다.
    //code copy한 부분
    final metadata = SettableMetadata(
        contentType: 'image/jpng',
        customMetadata: {'picked.file.path': file.path});
    return ref.putFile(f, metadata);
  }

  void _submitSignup(IUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      //로그인 성공
      user(signupUser);
    }
  }
}
