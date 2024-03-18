import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextStyle labelTextStyle;
  final double height;
  final TextInputType keyboardType;
  final TextStyle style;
  final String hintText;
  final TextStyle hintStyle;
  final Color borderColor;
  final Color focusedBorderColor;
  const CustomTextFieldWidget({
    super.key,
    required this.labelText,
    required this.labelTextStyle,
    this.height = 45,
    this.keyboardType = TextInputType.text,
    required this.style,
    this.hintText = "",
    required this.hintStyle,
    this.borderColor = const Color(0XFF0C356A),
    this.focusedBorderColor = const Color(0XFFFFC436),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: labelTextStyle,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: height,
          child: TextField(
            keyboardType: keyboardType,
            style: style,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: borderColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: focusedBorderColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
