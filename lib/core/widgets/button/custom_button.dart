import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moody_shop/core/theme/theme_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    this.height,
    required this.backgroundColor,
    required this.onTap,
    required this.enableTrailing,
    this.textColor,
  });
  final String text;
  final Color? textColor;
  final double width;
  final double? height;
  final Color backgroundColor;
  final Function()? onTap;
  final bool enableTrailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Row(
            mainAxisAlignment: enableTrailing == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? whiteColor,
                ),
              ),
              enableTrailing == true
                  ? Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                    )
                  : const SizedBox()
            ],
          )),
    );
  }
}
