import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/home.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

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
            Text('${Get.parameters['uid']}'),
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
