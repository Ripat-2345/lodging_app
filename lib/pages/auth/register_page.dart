import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_text_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/auth/check_box_gender_widget.dart';
import 'package:lodging_app/providers/auth_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void _validateMsgFormRegister(String msg) {
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
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                        controller: usernameController,
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
                        controller: emailController,
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
                        controller: passwordController,
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
                        controller: confirmPasswordController,
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
                        onPressed: () {
                          if (usernameController.text.isNotEmpty ||
                              emailController.text.isNotEmpty ||
                              passwordController.text.isNotEmpty ||
                              confirmPasswordController.text.isNotEmpty) {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              if (authProvider.register(
                                usernameController.text,
                                emailController.text,
                                confirmPasswordController.text,
                                "Male",
                              )) {
                                Navigator.pop(context);
                                _validateMsgFormRegister("Berhasil mendaftar!");
                              } else {
                                _validateMsgFormRegister(
                                  "Akun sudah terdaftar!",
                                );
                              }
                            } else {
                              _validateMsgFormRegister(
                                "Confirm password salah!",
                              );
                            }
                          } else {
                            _validateMsgFormRegister(
                              "Textfield tidak boleh kosong!",
                            );
                          }
                        },
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
