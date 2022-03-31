import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/controller/dependency_controller.dart';
import 'package:getx_example/pages/dependencys/get_lazyput.dart';
import 'package:getx_example/pages/dependencys/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('의존성 주입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const GetPut(),
                  binding: BindingsBuilder(() {
                    Get.put(DependencyController());
                  }),
                );
              },
              child: const Text('Getput'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const GetlazyPut(),
                  binding: BindingsBuilder(() {
                    Get.lazyPut<DependencyController>(
                        () => DependencyController());
                  }),
                );
              },
              child: const Text('Get.lazyPut'),
            ),

            //putAsync는 put처럼 비슷하지만 페이지에 접근할 때
            //비동기식으로 데이터를 받아오거나 가공처리를 하고나서
            //controller를 instance화 할 때 사용된다.
            ElevatedButton(
              onPressed: () {
                Get.to(const GetPut(), binding: BindingsBuilder(() {
                  Get.putAsync<DependencyController>(() async {
                    await Future.delayed(const Duration(seconds: 5));
                    return DependencyController();
                  });
                }));
              },
              //비동기를 처리해주고 put을 해준다.
              child: const Text('Get.putAsync'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
