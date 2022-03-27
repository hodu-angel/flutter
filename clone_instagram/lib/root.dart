import 'package:clone_instagram/app.dart';
import 'package:clone_instagram/controller/auth_controller.dart';
import 'package:clone_instagram/models/instagram_user.dart';
import 'package:clone_instagram/pages/login.dart';
import 'package:clone_instagram/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          //내부 파이어베이스 유저 정보를 조회 with user.data.uid
          return FutureBuilder<IUser?>(
              future: controller.loginUser(user.data!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const App();
                } else {
                  return const SignupPage();
                }
              });
        } else {
          return const Login();
        }
      },
    );
  }
}
