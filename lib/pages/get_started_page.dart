import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
          child: Column(
            children: [
              const SizedBox(height: 100),
              Container(
                width: 250,
                height: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 13,
                ),
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
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 25, right: 12, left: 12),
                width: 346,
                height: 235,
                padding: const EdgeInsets.all(20),
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
                  children: [
                    Text(
                      "Let's Get Started",
                      style: semiBoldTextStyle.copyWith(
                        color: darkBlueColor,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'We have a lot of lodging that you use not only for staying but growing.',
                      style: mediumTextStyle.copyWith(
                        color: blueColor,
                        fontSize: 16,
                        wordSpacing: 1,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Center(
                      child: CustomFilledButtonWidget(
                        buttonTitle: "Explore Lodging",
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
