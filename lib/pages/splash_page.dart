// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Timer(const Duration(seconds: 2), () async {
          final prefs = await SharedPreferences.getInstance();
          if (prefs.getBool('isGetStarted') != null) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          } else {
            await prefs.setBool('isGetStarted', true);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/get-started',
              (route) => false,
            );
          }
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/lodging_app_icon.png",
              width: 110,
              height: 110,
            ),
            Text(
              "Lodging",
              style: semiBoldTextStyle.copyWith(
                color: whiteColor,
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
