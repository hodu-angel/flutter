import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);
  //CountControllerWithGetx _countControllerWithGetx = Get.put(CountControllerWithGetx());

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        //context가 없으면 별도로 따로 함수로 빼서 만들 수 있다.
        Get.find<CountControllerWithGetx>().increase();
        //_countControllerWithGetx.increase();
      },
      child: const Text('+'),
    );
  }

  @override
  Widget build(BuildContext context) {
    //어디서든지 사용이 가능하다.
    Get.put(CountControllerWithGetx());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'GetX',
            style: TextStyle(fontSize: 50),
          ),
          GetBuilder<CountControllerWithGetx>(builder: (controller) {
            return Text('${controller.count}',
                style: const TextStyle(
                  fontSize: 50,
                ));
          }),
          _button(),
          // ElevatedButton(
          //   onPressed: () {
          //     //context가 없으면 별도로 따로 함수로 빼서 만들 수 있다.
          //     Get.find<CountControllerWithGetx>().increase();
          //   },
          //   child: const Text('+'),
          // ),
        ],
      ),
    );
  }
}
