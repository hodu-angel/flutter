import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseMemoizedExPage extends HookWidget {
  const UseMemoizedExPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: SquareCalculatorWidget(),
      )),
    );
  }
}

class SquareCalculatorWidget extends HookWidget {
  const SquareCalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 사용자 입력을 저장하는 변수.
    final inputController = useTextEditingController();
    var testValue = useState(0);

    // 입력 값에 따라 제곱 값을 계산하고 기억합니다.
    final square = useMemoized(() {
      final input = int.tryParse(inputController.text);
      if (input == null) return 0; // 입력이 유효하지 않으면 0을 반환합니다.
      return input * input; // 입력 값이 있다면 제곱 값을 계산합니다.
    }, [inputController.text]); // inputController.text가 변경될 때만 useMemoized가 실행됩니다.

    useEffect(() {
      testValue.value = square;
      return;
    }, [square]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                labelText: 'Enter a number plz',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Text(
              'Square: ${testValue.value}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class UsecallbackEx extends HookWidget {
  const UsecallbackEx({super.key});

  @override
  Widget build(BuildContext context) {
    var a = useState(0);
    var b = useState(0);

    var sumATOB = useCallback((a, b) {
      return a + b;
    }, [a, b]);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sumATOB(a.value, b.value).toString()),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      a.value++;
                    },
                    child: const Text('a')),
                ElevatedButton(
                    onPressed: () {
                      b.value++;
                    },
                    child: const Text('b')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(a.value.toString()),
                const SizedBox(width: 60),
                Text(b.value.toString()),
              ],
            )
          ],
        ),
      )),
    );
  }
}
