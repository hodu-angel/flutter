import 'package:flutter/material.dart';
import 'package:getx_example/pages/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Provider',
            style: TextStyle(fontSize: 50),
          ),
          Consumer<CountControllerWithProvider>(builder: (_, snapshot, child) {
            return Text(
              '${snapshot.count}',
              style: const TextStyle(
                fontSize: 50,
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              //listen: false를 하는 이유는 listen을 하게되면 build 전체가 build되는데.
              //그럼 Consumer가 필요가 없어서 false를 해준것. 충돌방지 차원.
              //또한 전체리소스가 build되기 때문에 효율성이 떨어진다.
              Provider.of<CountControllerWithProvider>(context, listen: false).increase();
            },
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}
