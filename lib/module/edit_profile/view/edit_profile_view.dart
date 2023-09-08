import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  Widget build(context, EditProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              size: 24,
              color: blackColor,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: const NetworkImage(
                  "https://i.ibb.co/PGv8ZzG/me.jpg",
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: greenAccent,
                        child: Icon(
                          Icons.camera_alt,
                          color: whiteColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomFormField(
                hintText: 'Fullname',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              CustomFormField(
                hintText: 'Email',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              CustomFormField(
                hintText: 'Date of birth',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: 'Update',
          width: Get.width,
          backgroundColor: greenAccent,
          onTap: () {},
          enableTrailing: false,
        ),
      ),
    );
  }

  @override
  State<EditProfileView> createState() => EditProfileController();
}
