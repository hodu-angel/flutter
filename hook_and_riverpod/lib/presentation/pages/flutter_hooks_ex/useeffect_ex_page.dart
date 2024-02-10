import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseEffectExPage extends HookWidget {
  const UseEffectExPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(1);

    // useEffect가 void useEffect(void Function()? Function() effect, [List<Object?>? keys])
    // 이므로 keys에 배열로 들어간다.
    // keys 안의 값은 build 메서드 위젯 안에서의 값은 넣을 수 있지만
    // 값의 변동사항이 생기더라도 useEffect가 호출되지 않는다.
    // class 멤버 변수인 경우에만 변동사항이 있을 경우 호출되는 것 같다.
    useEffect(() {
      log('useEffect 발동');
      return;
      // outCounter의 변경이 있을 경우 재빌드 합니다.
      // useEffect도 재실행 됩니다.
    }, []);

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
              child: const Text('increase counter'),
            ),
            const SizedBox(height: 50),
            SendCounterEx(outCounter: counter.value),
            // BasicCounterEx(outCounter: counter.value),
          ],
        ),
      )),
    );
  }
}

class SendCounterEx extends HookWidget {
  const SendCounterEx({super.key, required this.outCounter});
  final int outCounter;

  @override
  Widget build(BuildContext context) {
    // use로 시작되는 메서드들은 대부분 빌드 사이클 동안 객체가 유지됩니다.
    // var counter = useState(outCounter);

    // useEffect(() {
    //   log('sendCounter useEffect 발동 ${counter.value}');
    //   return;
    // }, [outCounter]);

    useEffect(() {
      log('sendCounter useEffect 발동');
      return;
    }, [outCounter]);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(outCounter.toString()),
        ],
      ),
    );
  }
}

class BasicCounterEx extends StatelessWidget {
  const BasicCounterEx({super.key, required this.outCounter});
  final int outCounter;

  @override
  Widget build(BuildContext context) {
    var counter = outCounter;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString()),
        ],
      ),
    );
  }
}
