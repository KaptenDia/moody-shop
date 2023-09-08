import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:moody_shop/module/cart/controller/cart_controller.dart';

import '../../../core/theme/theme_config.dart';

class CartProductGridItem extends StatelessWidget {
  final Map item;
  const CartProductGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 160.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item['photo'],
                  ),
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
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => controller.increaseQty(item),
                icon: Icon(
                  MdiIcons.plusBox,
                  size: 32.0,
                ),
              ),
              SizedBox(
                width: 20.0,
                height: 50.0,
                child: Center(
                  child: Text(
                    '${item['qty']}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => controller.decreaseQty(item),
                icon: Icon(
                  MdiIcons.minusBox,
                  size: 32.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
