import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final VoidCallback onPressed;
  const CustomTextButtonWidget({
    super.key,
    required this.title,
    this.titleColor = const Color(0XFF0C356A),
    this.titleFontSize = 16,
    this.titleFontWeight = FontWeight.w400,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: regularTextStyle.copyWith(
          color: titleColor,
          fontSize: titleFontSize,
          fontWeight: titleFontWeight,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
