import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';

import '../../../core/widgets/button/sort_filter_button.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Flash Sale",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              '13.4K Items',
              style: primaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: SortFilterButton(
                      text: 'Sort By',
                      icon: Icons.sort,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: SortFilterButton(
                      text: 'Filter',
                      icon: Icons.tune,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0 / 1.4,
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: controller.products.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.products[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          item["photo"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            // color: blackColor.withOpacity(0.4),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black54,
                                Colors.black45,
                                Colors.black38,
                                Colors.black26,
                                Colors.black12,
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: whiteColor,
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                item["product_name"],
                                style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                ),
                              ),
                              Text(
                                item["category"],
                                style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: whiteColor,
                                ),
                              ),
                              Text(
                                '\$${item["price"]}',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
