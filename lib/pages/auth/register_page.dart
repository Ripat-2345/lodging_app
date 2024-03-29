import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_text_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/auth/check_box_gender_widget.dart';
import 'package:lodging_app/theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  height: 666,
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
                            "Register",
                            style: semiBoldTextStyle.copyWith(
                              color: blueColor,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "account to find",
                            style: semiBoldTextStyle.copyWith(
                              color: darkBlueColor,
                              fontSize: 24,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                      Text(
                        "your lodging",
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // todo: email textfield
                      CustomTextFieldWidget(
                        labelText: "Username",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                        hintText: "your username",
                        hintStyle: regularTextStyle,
                      ),
                      const SizedBox(height: 20),
                      // todo: email textfield
                      CustomTextFieldWidget(
                        labelText: "Email Address",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                        hintText: "yourmail@____.com",
                        hintStyle: regularTextStyle,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      // todo: email textfield
                      CustomTextFieldWidget(
                        obscureText: true,
                        labelText: "Password",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                        hintText: "your password",
                        hintStyle: regularTextStyle,
                      ),
                      const SizedBox(height: 20),
                      // todo: email textfield
                      CustomTextFieldWidget(
                        obscureText: true,
                        labelText: "Confirm Password",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                        hintText: "confirm your password",
                        hintStyle: regularTextStyle,
                      ),
                      const SizedBox(height: 20),
                      // todo: gender checkbox
                      const CheckBoxGenderWidget(),
                      const SizedBox(height: 20),
                      // todo: register button
                      CustomFilledButtonWidget(
                        buttonTitle: "Register",
                        onPressed: () {},
                      ),
                      const SizedBox(height: 10),
                      // todo: back to login page
                      Center(
                        child: CustomTextButtonWidget(
                          title: "I have account, Login!",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
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
