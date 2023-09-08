import 'package:flutter/material.dart';
import 'package:moody_shop/core/theme/theme_config.dart';
import 'package:moody_shop/state_util.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    this.isPassword,
    required this.onChange,
  });
  final String hintText;
  final bool? isPassword;
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffCDCDCD),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: primaryTextStyle.copyWith(
                  fontSize: 16,
                  color: blackColor.withOpacity(0.6),
                ),
              ),
              onChanged: onChange,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          isPassword == true
              ? const Icon(Icons.visibility)
              : const Icon(
                  Icons.abc,
                  color: Color(0xffCDCDCD),
                ),
        ],
      ),
    );
  }
}
