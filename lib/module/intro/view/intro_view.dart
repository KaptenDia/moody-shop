import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  Widget build(context, IntroController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  List<Map<String, dynamic>> introItem = [
                    {
                      "image": male1,
                      "title": "Shop by Mood",
                      "description":
                          "Elevate your shopping experience with MoodyShop - the app that understands your mood and style. Browse and buy fashion that resonates with your emotions, helping you express yourself in a whole new way",
                    },
                    {
                      "image": male2,
                      "title": "Dress Your Emotions",
                      "description":
                          "Your emotions, your outfits. MoodyShop lets you shop fashion that aligns with how you feel. From joyful prints to introspective hues, curate a wardrobe that reflects every facet of your mood."
                    },
                    {
                      "image": illustration1,
                      "title": "Mood-Curated Shopping",
                      "description":
                          "Welcome to MoodyShop, where your mood leads the way. Our unique mood-curation feature suggests clothing and accessories tailored to your current state of mind. Discover fashion that speaks to you on a deeper level."
                    },
                    {
                      "image": illustration2,
                      "title": "Wear What You Feel",
                      "description":
                          "Unleash the power of your emotions through fashion with MoodyShop. Transform your shopping journey into an emotional expression. Wear your feelings, embrace your mood, and shop a collection that resonates with you."
                    }
                  ];

                  return Column(
                    children: [
                      Expanded(
                        child: CarouselSlider(
                          carouselController: controller.carouselController,
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 1.0,
                            enlargeFactor: 1.0,
                            disableCenter: true,
                            onPageChanged: (index, reason) {
                              controller.currentIndex = index;
                              controller.setState(() {});
                            },
                          ),
                          items: introItem.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              item["image"],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      item["title"],
                                      textAlign: TextAlign.center,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      item["description"],
                                      textAlign: TextAlign.center,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: introItem.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => controller.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          controller.currentIndex == entry.key
                                              ? 0.9
                                              : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomButton(
          text: 'Next',
          width: Get.width,
          backgroundColor: blackColor,
          enableTrailing: true,
          onTap: () {
            Get.toReplacement(const LoginView());
          },
        ),
      ),
    );
  }

  @override
  State<IntroView> createState() => IntroController();
}
