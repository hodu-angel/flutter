import 'package:clone_instagram/controller/auth_controller.dart';
import 'package:clone_instagram/models/instagram_user.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final String uid;
  const SignupPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Widget _avatar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/images/default_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          child: const Text('이미지 변경'),
        ),
      ],
    );
  }

  Widget _nickname() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: nicknameController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: '닉네임',
        ),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: descriptionController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: '설명',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '회원가입',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _avatar(),
            const SizedBox(height: 30),
            _nickname(),
            const SizedBox(height: 30),
            _description(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: ElevatedButton(
          onPressed: (){
            var signupUser = IUser(
              //uid는 sns로그인에서 받아온 uid
              uid: widget.uid,
              nickname: nicknameController.text,
              description: descriptionController.text,
            );
            AuthController.to.signup(signupUser);
          },
          child: const Text('회원가입'),
        ),
      ),
    );
  }
}
