import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/home.dart';
import 'package:getx_example/pages/named/first.dart';
import 'package:getx_example/pages/named/second.dart';

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
      initialRoute: '/',
      // routes: {
      //   '/' : (context) => const Home(),
      //   '/first' : (context) => const FirstNamedPage(),
      //   '/second' : (context) => const SecondNamedPage(),
      // },
      getPages: [
        GetPage(name: '/', page: ()=> const Home()),
        GetPage(name: '/first', page: ()=> const FirstNamedPage()),
        GetPage(name: '/second', page: ()=> const SecondNamedPage()),
      ],
    );
  }
}
