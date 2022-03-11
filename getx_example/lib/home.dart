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
                //기존소스
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) => const FirstPage()),
                // );
                Get.to(const FirstPage());
              },
              child: const Text('일반적인 라우트'),
            ),
          ],
        ),
      ),
    );
  }
}
