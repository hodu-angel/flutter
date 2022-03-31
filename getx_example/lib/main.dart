import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/binding/binding_page.dart';
import 'package:getx_example/home.dart';
import 'package:getx_example/pages/binding.dart';
import 'package:getx_example/pages/controller/count_controller_with_getx.dart';
import 'package:getx_example/pages/controller/dependency_controller.dart';
import 'package:getx_example/pages/named/first.dart';
import 'package:getx_example/pages/named/second.dart';
import 'package:getx_example/pages/next.dart';
import 'package:getx_example/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.white38, onPrimary: Colors.black),
        ),
      ),
      //initialRoute: '/',
      // routes: {
      //   '/' : (context) => const Home(),
      //   '/first' : (context) => const FirstNamedPage(),
      //   '/second' : (context) => const SecondNamedPage(),
      // },
      getPages: [
        //transition: 화면 전환시 애니메이션
        GetPage(
            name: '/', page: () => const Home(), transition: Transition.zoom),
        GetPage(
            name: '/first',
            page: () => const FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/second',
            page: () => const SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/next',
            page: () => const NextPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/user/:uid',
            page: () => const UserPage(),
            transition: Transition.zoom),
        GetPage(
          name: '/binding',
          page: () => const BindingPage(),
          binding: BindingPageBinding(),
        ),
      ],
    );
  }
}
