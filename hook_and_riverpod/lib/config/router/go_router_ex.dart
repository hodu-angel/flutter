import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hook_and_riverpod/presentation/pages/flutter_hooks_ex/flutter_hooks_ex_page.dart';
import 'package:hook_and_riverpod/presentation/pages/home_page.dart';

enum RouterName {
  home,
  flutterHooks,
}

extension GoRoutesName on RouterName {
  // ignore: deprecated_member_use
  String get name => describeEnum(this);

  /// Convert to `lower-snake-case` format.
  String get path {
    var exp = RegExp(r'(?<=[a-z])[A-Z]');
    var result = name.replaceAllMapped(exp, (m) => '-${m.group(0)}').toLowerCase();
    return result;
  }

  /// Convert to `lower-snake-case` format with `/`.
  String get fullPath {
    var exp = RegExp(r'(?<=[a-z])[A-Z]');
    var result = name.replaceAllMapped(exp, (m) => '-${m.group(0)}').toLowerCase();
    return '/$result';
  }
}

var goRouter = GoRouter(routes: [
  ShellRoute(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: RouterName.flutterHooks.name,
        path: '/flutterHooks',
        builder: (context, state) => const FlutterHooksExPage(),
      ),
    ],
    builder: (context, state, child) {
      return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: const [
          BottomNavigationBarItem(label: 'home', icon: Icon(Icons.heart_broken)),
          BottomNavigationBarItem(label: 'home2', icon: Icon(Icons.ac_unit_outlined)),
        ]),
      );
    },
  ),
  GoRoute(
    name: RouterName.home.name,
    path: '/home',
    builder: (context, state) => const HomePage(),
  ),
]);
