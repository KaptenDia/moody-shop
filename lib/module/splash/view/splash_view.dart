import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moody_shop/core.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  Widget build(context, SplashController controller) {
    controller.view = this;

    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          iconLogo,
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  State<SplashView> createState() => SplashController();
}
