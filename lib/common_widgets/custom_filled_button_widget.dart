import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class CustomFilledButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color buttonColor;
  final String buttonTitle;
  final Color buttonTitleColor;
  final double buttonTitleFontSize;
  final FontWeight buttonTitleFontWeight;
  final VoidCallback onPressed;
  const CustomFilledButtonWidget({
    super.key,
    this.height = 50,
    this.width = double.infinity,
    this.buttonColor = const Color(0XFFFFC436),
    required this.buttonTitle,
    this.buttonTitleColor = const Color(0XFF0C356A),
    this.buttonTitleFontSize = 16,
    this.buttonTitleFontWeight = FontWeight.w500,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            buttonColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
          style: mediumTextStyle.copyWith(
            color: buttonTitleColor,
            fontSize: buttonTitleFontSize,
            fontWeight: buttonTitleFontWeight,
          ),
        ),
      ),
    );
  }
}
