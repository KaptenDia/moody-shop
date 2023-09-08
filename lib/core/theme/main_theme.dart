import 'package:flutter/material.dart';
import 'package:moody_shop/core/theme/theme_config.dart';

class MainTheme {
  static getMainTheme() {
    ThemeData(
      primaryColor: blackColor,
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }
}
