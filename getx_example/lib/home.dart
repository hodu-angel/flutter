import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(const FirstPage());
              },
              child: const Text('일반적인 라우트'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/first');
                //Navigator.pushNamed(context, '/first');
              },
              child: const Text('Named 라우트'),
            ),
          ],
        ),
      ),
    );
  }
}
