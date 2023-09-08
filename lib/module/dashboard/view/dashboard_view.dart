import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moody_shop/core.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(iconLogo),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Dashboard",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: InkWell(
              onTap: () => Get.to(const CartView()),
              child: Badge(
                label: const Text(
                  "4",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Builder(builder: (context) {
              List images = [
                "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
              ];

              return CarouselSlider(
                options: CarouselOptions(
                  height: 90.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Categories",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "See all",
                            style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0 / 0.3,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: controller.categories.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.categories[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item,
                                  style: primaryTextStyle.copyWith(
                                    color: whiteColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: whiteColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Flash Sale",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: InkWell(
                        onTap: () => Get.to(const ProductListView()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "See all",
                              style: primaryTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0 / 1.6,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 9,
                    ),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.products[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                            ProductDetailView(
                              item: item,
                            ),
                          );
                        },
                        child: Container(
                          color: whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 160.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(item["photo"]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                  child: const Stack(
                                    children: [
                                      Positioned(
                                        right: 6,
                                        top: 6,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 16,
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                item["product_name"],
                                style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item["category"],
                                style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '\$${item["price"]}',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
