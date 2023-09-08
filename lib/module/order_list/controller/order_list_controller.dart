import 'package:flutter/material.dart';
import 'package:moody_shop/core.dart';
import '../view/order_list_view.dart';

class OrderListController extends State<OrderListView> {
  static late OrderListController instance;
  late OrderListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List<Map<String, dynamic>> orderList = [
    {
      "id": 1,
      "created_at": "2023-09-05 20:17:00",
      "shipping_address": {
        "name": "Pramudia",
        "detail": "Kp. Panyairan no 10xxx, Kota Bandung",
      },
      "courier": {
        "name": "Sicepat",
        "detail": "One day Shipping",
      },
      "payment_method": {
        "name": "Debit Card",
        "detail": "MasterCard ending in 1234",
      },
      "items": [
        {"id": 1, "product_name": "Laptop", "qty": 1, "price": 499},
        {"id": 2, "product_name": "Smartphone", "qty": 1, "price": 199},
        {"id": 3, "product_name": "Smartwatch", "qty": 2, "price": 99},
        {"id": 4, "product_name": "Jam tangan", "qty": 3, "price": 33},
        {"id": 5, "product_name": "Keychron k3", "qty": 4, "price": 103},
        {"id": 6, "product_name": "Speaker", "qty": 6, "price": 50.0},
        {"id": 7, "product_name": "Mouse", "qty": 1, "price": 19},
        {"id": 8, "product_name": "Ransel", "qty": 5, "price": 20},
        {"id": 9, "product_name": "Dompet", "qty": 2, "price": 9},
        {"id": 10, "product_name": "Sepatu", "qty": 3, "price": 29},
      ],
      "total": 2940.0,
      "status": "Pending",
    },
    {
      "id": 2,
      "created_at": "2023-09-05 20:44:00",
      "shipping_address": {
        "name": "Angga",
        "detail": "Kp. Panyairan, Kota Bandung",
      },
      "courier": {
        "name": "JNE",
        "detail": "Reguler Shipping",
      },
      "payment_method": {
        "name": "Credit Card",
        "detail": "Visa ending in 1234",
      },
      "items": [
        {"id": 1, "product_name": "Laptop", "qty": 1, "price": 499},
        {"id": 2, "product_name": "Smartphone", "qty": 1, "price": 199},
        {"id": 3, "product_name": "Smartwatch", "qty": 2, "price": 99},
      ],
      "total": 997.0,
      "status": "Shipped",
    },
    {
      "id": 3,
      "created_at": "2023-09-05 21:04:00",
      "shipping_address": {
        "name": "Prahasta",
        "detail": "Kp. Panyairan Dano, Kota Bandung",
      },
      "courier": {
        "name": "JNT",
        "detail": "Reguler Shipping",
      },
      "payment_method": {
        "name": "Credit Card",
        "detail": "MasterCard ending in 1234",
      },
      "items": [
        {"id": 1, "product_name": "Laptop", "qty": 1, "price": 499},
        {"id": 2, "product_name": "Smartphone", "qty": 1, "price": 199},
        {"id": 3, "product_name": "Smartwatch", "qty": 2, "price": 99},
      ],
      "total": 997.0,
      "status": "Delivered",
    }
  ];

  List<Map<String, dynamic>> get shippedOrderItems {
    return orderList
        .where((element) => element["status"] == "Shipped")
        .toList();
  }

  List<Map<String, dynamic>> get deliveredOrderItems {
    return orderList
        .where((element) => element["status"] == "Delivered")
        .toList();
  }

  List<Map<String, dynamic>> get pendingOrderItems {
    return orderList
        .where((element) => element["status"] == "Pending")
        .toList();
  }
}
