import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/controller/count_controller_with_getx.dart';
import 'package:getx_example/pages/controller/count_controller_with_provider.dart';
import 'package:getx_example/pages/state/with_getx.dart';
import 'package:getx_example/pages/state/with_provider.dart';
import 'package:provider/provider.dart';

//단순 상태관리는 provider와 굉장히 유사하다.
//그래서 여기선 provider와 비교하며 공부해 볼 것이다.

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('단순상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: WithGetX(),
            ),
            Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
                create: (_) => CountControllerWithProvider(),
                child: const WithProvider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
