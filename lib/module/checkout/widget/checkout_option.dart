import 'package:flutter/material.dart';

import '../../../core/theme/theme_config.dart';

class CheckoutOption extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String? subtitle2;
  const CheckoutOption(
      {super.key,
      required this.title,
      required this.subtitle1,
      this.subtitle2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6.0,
              ),
              Text(
                subtitle1,
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              if (subtitle2 != null)
                Text(
                  subtitle2!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
            ],
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 24,
            color: blackColor,
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
