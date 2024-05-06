import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/get-started',
        (route) => false,
      ),
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
