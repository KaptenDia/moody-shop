import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moody_shop/core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SvgPicture.asset(
              iconLogo,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              hintText: 'Full Name',
              onChange: (value) {},
            ),
            const SizedBox(
              height: 12,
            ),
            CustomFormField(
              hintText: 'Email',
              onChange: (value) {},
            ),
            const SizedBox(
              height: 12,
            ),
            CustomFormField(
              hintText: 'Password',
              onChange: (value) {},
              isPassword: true,
            ),
            const SizedBox(
              height: 12,
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              CustomButton(
                text: 'Create an Account',
                width: Get.width,
                backgroundColor: blackColor,
                onTap: () {},
                enableTrailing: false,
                textColor: whiteColor,
              ),
            const SizedBox(
              height: 20,
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'By signing up, you agree to our\n',
                      style: primaryTextStyle.copyWith(
                        color: blackColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms',
                      style: primaryTextStyle.copyWith(
                        color: greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: primaryTextStyle.copyWith(
                        color: blackColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy',
                      style: primaryTextStyle.copyWith(
                        color: greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                    ),
                  ],
                ),
              ),
            const Spacer(),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'I have an account',
                  style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
