import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/controller/dependency_controller.dart';

class GetlazyPut extends StatelessWidget {
  const GetlazyPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: (){
          Get.find<DependencyController>().increase();
        },
        child: const Text('Get.lazyPut controller 접근'),
      ),
    );
  }
}
