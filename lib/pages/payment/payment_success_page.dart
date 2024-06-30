import 'package:flutter/material.dart';
import 'package:lodging_app/pages/bottom_menu_bar_page.dart';
import 'package:lodging_app/theme.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomMenuBarPage(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Payment Success",
            style: semiBoldTextStyle.copyWith(
              color: darkBlueColor,
              fontSize: 30,
            ),
          ),
          Text(
            "Please wait you will direct to home page",
            style: mediumTextStyle.copyWith(
              color: blueColor,
            ),
          ),
          LottieBuilder.asset(
            "assets/images/animation_success.json",
            height: MediaQuery.of(context).size.height / 2,
            frameRate: FrameRate.max,
          ),
        ],
      ),
    );
  }
}
