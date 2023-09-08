import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';
import 'package:moody_shop/module/checkout/widget/checkout_option.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  Widget build(context, CheckoutController controller) {
    controller.view = this;
    final cartController = CartController.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(
          color: blackColor,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Cart Items'),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartController.products.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = cartController.products[index];
                  double total = double.parse(item['qty'].toString()) *
                      double.parse(item['price'].toString());
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(
                        item['photo'],
                      ),
                    ),
                    title: Text(
                      item['product_name'],
                    ),
                    subtitle: Text(
                      "QTY : ${item['qty']}   Price : \$${item['price']}",
                    ),
                    trailing: Text(
                      '\$$total',
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const CheckoutOption(
                title: 'Shipping Address',
                subtitle1: 'Rumah',
                subtitle2: 'Kp. Panyairan',
              ),
              const CheckoutOption(
                title: 'Shipping Method',
                subtitle1: 'Siabang Driver - Yes',
              ),
              const CheckoutOption(
                title: 'Payment',
                subtitle1: 'BCA - MasterCard *****2210',
              ),
              const CheckoutOption(
                title: 'Promo Code',
                subtitle1: 'No promo code',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Colors.grey[400]!,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subtotal \$214',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Shipping \$24',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Tax: 10%',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Promocode : 50% off',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
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
                          '\$109.94',
                          style: primaryTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 20.0,
              ),
              CustomButton(
                text: 'Confirm',
                width: Get.width,
                backgroundColor: greenAccent,
                onTap: () {},
                enableTrailing: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CheckoutView> createState() => CheckoutController();
}
