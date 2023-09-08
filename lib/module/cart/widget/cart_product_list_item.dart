import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:moody_shop/core.dart';

class CartProductListItem extends StatelessWidget {
  final Map item;
  const CartProductListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 84.0,
          width: 84.0,
          margin: const EdgeInsets.only(bottom: 12.0),
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
        ),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item["product_name"],
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item['category'],
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                '\$${item['price']}',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Wrap(
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
    );
  }
}
