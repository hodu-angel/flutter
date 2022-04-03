import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_controller_service/controller/getx_controller_test.dart';

class GetxControllerWidget extends GetView<GetxControllerTest> {
  const GetxControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.count.value.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                controller.increase();
              },
              child: const Text(
                'Getx Controller increase',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
