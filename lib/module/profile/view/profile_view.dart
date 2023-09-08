import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 64.0,
                backgroundImage: NetworkImage(
                  "https://i.ibb.co/PGv8ZzG/me.jpg",
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Angga',
                style: primaryTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Mobile Developer',
                style: primaryTextStyle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "OTHER INFORMATION",
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = controller.menuItems[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      item['label'],
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 24,
                    ),
                    onTap: () {
                      Get.to(const EditProfileView());
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  );
                },
                itemCount: controller.menuItems.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
