import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_text_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/theme.dart';

class VerifyForgotPasswordPage extends StatelessWidget {
  const VerifyForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: darkBlueColor.withOpacity(0.6),
          child: Center(
            child: SingleChildScrollView(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: 346,
                  height: 375,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.8),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Forgot Password?",
                            style: semiBoldTextStyle.copyWith(
                              color: darkBlueColor,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      //todo: Email Address Field
                      CustomTextFieldWidget(
                        labelText: "Email Address",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                        style: mediumTextStyle.copyWith(color: darkBlueColor),
                        hintText: "",
                        hintStyle: regularTextStyle,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      // todo: Verification Field
                      CustomTextFieldWidget(
                        labelText: "Verification Code",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                        style: mediumTextStyle.copyWith(color: darkBlueColor),
                        hintText: "",
                        hintStyle: regularTextStyle,
                        obscureText: true,
                      ),
                      const SizedBox(height: 5),
                      // todo: Get Code
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButtonWidget(
                          title: "Get Code",
                          titleColor: darkBlueColor,
                          titleFontWeight: FontWeight.w600,
                          titleFontSize: 14,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      // todo: Reset Button
                      const SizedBox(height: 15),
                      CustomFilledButtonWidget(
                        buttonTitle: "Verify Now",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/reset-password',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
