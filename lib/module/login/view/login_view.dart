import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moody_shop/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome\nto MoodyShop',
                        style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "Everything you want right here!",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    iconLogo,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              const Spacer(),
              CustomFormField(
                hintText: 'Email',
                isPassword: false,
                onChange: (value) {},
              ),
              const SizedBox(
                height: 12,
              ),
              CustomFormField(
                hintText: 'Password',
                isPassword: true,
                onChange: (value) {},
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButton(
                text: 'Login',
                width: Get.width,
                backgroundColor: blackColor,
                onTap: () {
                  Get.toReplacement(const MainNavigationView());
                },
                enableTrailing: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const ForgotPasswordView());
                },
                child: Text(
                  'Forgot Password?',
                  style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Sign Up',
                width: Get.width,
                backgroundColor: blackColor,
                onTap: () {
                  Get.to(const RegisterView());
                },
                enableTrailing: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
