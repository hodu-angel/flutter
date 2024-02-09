import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStateExPage extends HookWidget {
  const UseStateExPage({super.key});

  @override
  Widget build(BuildContext context) {
    // useState 값안으로 initial값을 작성합니다.
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.value.toString()),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                counter.value++;
              },
              child: const Text('increase'),
            ),
          ],
        ),
      )),
    );
  }
}
