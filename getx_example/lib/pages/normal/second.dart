import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: Get.back,
              //기존방식
              //     () {
              //   Navigator.pop(context);
              // },
              child: const Text('뒤로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get.to(const Home());
                //Get.offAll(const Home());
                //Get.offAll 과 같은 효과를 내는 Navigator.pushAndRemoveUntil
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (_) => const Home() ), (
                    route) => false);
              },
              child: const Text('홈 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
