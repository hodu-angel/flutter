import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_controller_service/controller/getx_controller_test.dart';
import 'package:getx_controller_service/pages/getx_controller_widget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const GetxControllerWidget(),
                  binding: BindingsBuilder(() {
                    Get.lazyPut<GetxControllerTest>(() => GetxControllerTest());
                  }),
                );
              },
              child: const Text('Getx Controller'),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Getx Service'),
            ),
          ],
        ),
      ),
    );
  }
}
