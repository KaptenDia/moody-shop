import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';
import 'package:moody_shop/core/widgets/button/sort_filter_button.dart';
import 'package:moody_shop/module/cart/widget/cart_product_grid_item.dart';
import 'package:moody_shop/module/cart/widget/cart_product_list_item.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  Widget build(context, CartController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: BackButton(
          color: blackColor,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blueGrey[900],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Expanded(
                  child: SortFilterButton(
                    text: 'Sort By',
                    icon: Icons.sort,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                const Expanded(
                  child: SortFilterButton(
                    text: 'Filter',
                    icon: Icons.tune,
                  ),
                ),
                IconButton(
                  onPressed: () => controller.updateMode(),
                  icon: Icon(
                    controller.gridMode ? Icons.grid_3x3 : Icons.list,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            if (controller.gridMode == false)
              Expanded(
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.products[index];
                    return CartProductListItem(item: item);
                  },
                ),
              ),
            if (controller.gridMode)
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0 / 1.6,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: controller.products.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.products[index];
                    return CartProductGridItem(item: item);
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Colors.grey[300]!,
            ),
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            SizedBox(
              width: Get.width,
              height: 40.0,
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Items',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${controller.products.length}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total(qty)',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${controller.totalQty}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$${controller.total}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20.0,
            ),
            CustomButton(
              text: 'Checkout',
              width: Get.width,
              backgroundColor: greenAccent,
              onTap: () {
                Get.to(const CheckoutView());
              },
              enableTrailing: false,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<CartView> createState() => CartController();
}
