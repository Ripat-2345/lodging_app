import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_text_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/bottom_menu_bar_page.dart';
import 'package:lodging_app/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  height: 468,
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
                            "Login",
                            style: semiBoldTextStyle.copyWith(
                              color: blueColor,
                              fontSize: 23,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "to continue your",
                            style: semiBoldTextStyle.copyWith(
                              color: darkBlueColor,
                              fontSize: 23,
                            ),
                            maxLines: 2,
                          )
                        ],
                      ),
                      Text(
                        "explore",
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //todo: Email Address Field
                      CustomTextFieldWidget(
                        labelText: "Email Address",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                        style: mediumTextStyle.copyWith(color: darkBlueColor),
                        hintText: "Input your email",
                        hintStyle: regularTextStyle,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      // todo: Password Field
                      CustomTextFieldWidget(
                        labelText: "Password",
                        labelTextStyle: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                        style: mediumTextStyle.copyWith(color: darkBlueColor),
                        hintText: "Input your password",
                        hintStyle: regularTextStyle,
                        obscureText: true,
                      ),
                      const SizedBox(height: 5),
                      // todo: Forget Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButtonWidget(
                          title: "Forgot Password!",
                          titleColor: darkBlueColor,
                          titleFontSize: 14,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      // todo: Login Button
                      const SizedBox(height: 15),
                      CustomFilledButtonWidget(
                        buttonTitle: "Login",
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomMenuBarPage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      // todo: Go To Register Page
                      Center(
                        child: CustomTextButtonWidget(
                          title: "Create New Account",
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                        ),
                      )
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
