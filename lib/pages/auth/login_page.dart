import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_text_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/bottom_menu_bar_page.dart';
import 'package:lodging_app/providers/auth_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void _validateMsgFormLogin(String msg) {
    var snackBar = SnackBar(
      content: Text(
        msg,
        style: mediumTextStyle.copyWith(
          color: darkBlueColor,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: yellowColor,
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
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
                        controller: emailController,
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
                        controller: passwordController,
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
                          titleFontWeight: FontWeight.w600,
                          titleFontSize: 14,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/verify-forgot-password',
                            );
                          },
                        ),
                      ),
                      // todo: Login Button
                      const SizedBox(height: 15),
                      CustomFilledButtonWidget(
                        buttonTitle: "Login",
                        onPressed: () {
                          if (emailController.text.isNotEmpty ||
                              passwordController.text.isNotEmpty) {
                            if (authProvider.login(
                              emailController.text,
                              passwordController.text,
                            )) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomMenuBarPage(),
                                ),
                                (route) => false,
                              );
                            } else {
                              _validateMsgFormLogin(
                                "Periksa lagi email & password anda!",
                              );
                            }
                          } else {
                            _validateMsgFormLogin(
                              "Email & password wajib di isi!",
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      // todo: Go To Register Page
                      Center(
                        child: CustomTextButtonWidget(
                          title: "Create New Account",
                          titleFontWeight: FontWeight.w600,
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
