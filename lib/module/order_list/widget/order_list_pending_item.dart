import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moody_shop/core.dart';

class OrderListPendingItem extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const OrderListPendingItem({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return Column(
          children: [
            ListTile(
              onTap: () => Get.to(OrderDetailView(
                item: item,
              )),
              title: Text(
                "#${item['id']}",
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    DateFormat("dd MMMM y kk:mm:ss")
                        .format(DateTime.parse(item["created_at"])),
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "${item["payment_method"]["name"]}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "${item["courier"]["name"]}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              trailing: Text(
                '\$140',
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              color: blackColor,
              thickness: 1,
            ),
          ],
        );
      },
    );
  }
}
