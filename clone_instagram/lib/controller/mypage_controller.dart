import 'package:clone_instagram/controller/auth_controller.dart';
import 'package:clone_instagram/models/instagram_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MypageController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  Rx<IUser> targetUser = IUser().obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  void setTargetUser() {
    var uid = Get.parameters['targetUid'];
    //내것일 때
    if (uid == null) {
      targetUser(AuthController.to.user.value);
    } else {
      //상대방 uid로 users collection을 조회해 담아준다.

    }
  }

  void _loadData() {
    setTargetUser();
    //포스트 리스트 로드
    //사용자 정보 로드
  }
}
