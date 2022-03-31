import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/controller/count_controller_with_getx.dart';

class BindingPage extends GetView<CountControllerWithGetx> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.count.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            ),
            // GetBuilder<CountControllerWithGetx>(builder: (_) {
            //   return Text(
            //     _.count.toString(),
            //     style: const TextStyle(fontSize: 40),
            //   );
            // }),
            ElevatedButton(
              onPressed: () {
                //CountControllerWithGetx.to.increase();
                controller.increase();
              },
              child: const Text(
                '+',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
