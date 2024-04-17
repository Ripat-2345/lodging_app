import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: semiBoldTextStyle.copyWith(fontSize: 28, color: darkBlueColor),
        ),
      ),
    );
  }
}
