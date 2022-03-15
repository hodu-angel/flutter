import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/home.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('${Get.arguments['name']} : ${Get.arguments['age']}'),
            Text('${(Get.arguments as User).name} : ${(Get.arguments as User).age}'),
            ElevatedButton(
              onPressed: Get.back,
              child: const Text('뒤로 이동'),
            ),

          ],
        ),
      ),
    );
  }
}
