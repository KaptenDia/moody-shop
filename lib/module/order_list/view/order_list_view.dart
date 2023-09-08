import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';
import 'package:moody_shop/module/order_list/widget/order_list_pending_item.dart';
import 'package:moody_shop/module/order_list/widget/order_list_shipped_item.dart';

import '../widget/order_list_delivered_item.dart';

class OrderListView extends StatefulWidget {
  const OrderListView({Key? key}) : super(key: key);

  Widget build(context, OrderListController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: primaryTextStyle.copyWith(color: blackColor),
            indicatorColor: blackColor,
            labelColor: blackColor,
            tabs: const [
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Shipped",
              ),
              Tab(
                text: "Delivered",
              ),
            ],
          ),
          title: Text(
            'Order List',
            style: primaryTextStyle.copyWith(
              fontSize: 24,
              color: blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: TabBarView(
          children: [
            OrderListPendingItem(
              items: controller.pendingOrderItems,
            ),
            OrderListShippedItem(
              items: controller.shippedOrderItems,
            ),
            OrderListDeliveredItem(
              items: controller.deliveredOrderItems,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<OrderListView> createState() => OrderListController();
}
