import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/pages/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key? key}) : super(key: key);
  final CountControllerWithGetx _countControllerWithGetx =
      Get.put(CountControllerWithGetx());

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        //context가 없으면 별도로 따로 함수로 빼서 만들 수 있다.
        //Get.find<CountControllerWithGetx>().increase(id);
        _countControllerWithGetx.increase();
      },
      child: const Text(
        '+',
        style: TextStyle(fontSize: 30),
      ),
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
            style: TextStyle(fontSize: 30),
          ),
          GetBuilder<CountControllerWithGetx>(builder: (controller) {
            //이미 5인상태에서 계속해서 호출될 수 있다.
            //그래서 반응형을 사용하면 그나마 덜 resource를 사용하면서 화면을 제어 할 수있단 장점이 있음
            print('update');
            return Text('${controller.count}',
                style: const TextStyle(
                  fontSize: 50,
                ));
          }),
          _button(),
          ElevatedButton(
            onPressed: () {
              _countControllerWithGetx.putNumber(5);
            },
            child: const Text(
              '5로 변경',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
