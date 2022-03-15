import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/normal/second.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Named Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //현재페이지를 없애고 다음페이지 이동
                Get.offNamed('/second');
                //Get.toNamed('/second');
              },
              child: const Text('다음페이지 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
