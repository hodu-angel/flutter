import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hook_and_riverpod/presentation/pages/flutter_hooks_ex/flutter_hooks_ex_page.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/flutterHooks');
                  // context.go('/home');
                  // context.goNamed(RouterName.flutterHooks.name);
                },
                child: const Text('flutter_hooks_example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const FlutterHooksExPage();
                    },
                  ));
                },
                child: const Text('go_router')),
          ],
        ),
      )),
    );
  }
}
