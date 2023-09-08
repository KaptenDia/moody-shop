import 'package:flutter/material.dart';

import '../../theme/theme_config.dart';

class SortFilterButton extends StatelessWidget {
  const SortFilterButton({super.key, required this.text, required this.icon});
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: whiteColor,
                ),
              ),
            ),
            Icon(
              icon,
              size: 24.0,
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
