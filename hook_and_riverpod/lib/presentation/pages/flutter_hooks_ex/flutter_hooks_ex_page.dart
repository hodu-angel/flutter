import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hook_and_riverpod/presentation/pages/flutter_hooks_ex/useeffect_ex_page.dart';
import 'package:hook_and_riverpod/presentation/pages/flutter_hooks_ex/usememoized_ex_page.dart';
import 'package:hook_and_riverpod/presentation/pages/flutter_hooks_ex/usestate_ex_page.dart';

class FlutterHooksExPage extends HookWidget {
  const FlutterHooksExPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const UseStateExPage();
                    },
                  ));
                },
                child: const Text('useState')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const UseEffectExPage();
                    },
                  ));
                },
                child: const Text('useEffect')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const UseMemoizedExPage();
                    },
                  ));
                },
                child: const Text('useMemoized')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const UsecallbackEx();
                    },
                  ));
                },
                child: const Text('useCallback')),
          ],
        ),
      )),
    );
  }
}
