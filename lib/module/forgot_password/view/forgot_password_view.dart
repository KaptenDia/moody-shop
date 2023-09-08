import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  Widget build(context, ForgotPasswordController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "ForgotPassword",
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomFormField(
                hintText: 'Email',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButton(
                text: 'Forgot Password',
                width: Get.width,
                backgroundColor: blackColor,
                onTap: () {},
                enableTrailing: false,
                textColor: whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ForgotPasswordView> createState() => ForgotPasswordController();
}
