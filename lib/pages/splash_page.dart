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
        child: Container(
          width: 250,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: whiteColor,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 188,
              height: 34,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
