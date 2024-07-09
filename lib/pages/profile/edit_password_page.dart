import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/auth/login_page.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _validateEditPassword(String msg) {
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
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 28,
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
          ),
        ),
        title: Text(
          'Edit Password',
          style: semiBoldTextStyle.copyWith(
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: 22,
            top: 10,
            right: 22,
            bottom: 22,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFieldWidget(
                controller: _currentPasswordController,
                labelText: "Current Password",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _newPasswordController,
                labelText: "New Password",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _confirmPasswordController,
                labelText: "Confirm New Password",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: CustomFilledButtonWidget(
                  buttonTitle: "Edit Password",
                  width: 170,
                  onPressed: () {
                    if (_currentPasswordController.text.isNotEmpty ||
                        _newPasswordController.text.isNotEmpty ||
                        _confirmPasswordController.text.isNotEmpty) {
                      if (_newPasswordController.text ==
                          _confirmPasswordController.text) {
                        _validateEditPassword("Password berhasil di ubah!");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false,
                        );
                      } else {
                        _validateEditPassword("Confirm password salah!");
                      }
                    } else {
                      _validateEditPassword("Mohon isi semua textfield!");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
