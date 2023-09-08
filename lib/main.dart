import 'package:moody_shop/core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: MainTheme.getMainTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
