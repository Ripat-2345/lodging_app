import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/pages/bottom_menu_bar_page.dart';
import 'package:lodging_app/theme.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Message",
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Are you sure for paying this reservation!",
                style: mediumTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomFilledButtonWidget(
                    buttonTitle: "Cancel",
                    width: 100,
                    height: 38,
                    buttonColor: Colors.grey,
                    buttonTitleColor: whiteColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  CustomFilledButtonWidget(
                    buttonTitle: "Pay",
                    width: 80,
                    height: 38,
                    buttonColor: yellowColor,
                    buttonTitleColor: darkBlueColor,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomMenuBarPage(),
                        ),
                        (route) => false,
                      );
                      var snackBar = SnackBar(
                        content: Text(
                          "Your reservation completed, thank you!",
                          style: mediumTextStyle.copyWith(color: Colors.black),
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: yellowColor,
                        behavior: SnackBarBehavior.floating,
                        shape: const StadiumBorder(),
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
