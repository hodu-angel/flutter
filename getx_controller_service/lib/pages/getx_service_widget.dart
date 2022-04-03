import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_controller_service/controller/getx_service_test.dart';

class GetxServiceWidget extends GetView<GetxServiceTest> {
  const GetxServiceWidget({Key? key}) : super(key: key);

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
                'Getx Service increase',
                style: TextStyle(fontSize: 15),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                //Get.deleteAll(force: true);
                Get.delete<GetxServiceTest>(force: true);
              },
              child: const Text(
                'Getx Service clear',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
