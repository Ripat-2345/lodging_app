import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class PaymentTransferPage extends StatelessWidget {
  final String paymentMethod;
  const PaymentTransferPage({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(
          'Payment Transfer',
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
              Row(
                children: [
                  Icon(
                    Icons.payment_rounded,
                    color: darkBlueColor,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    "TRANSFER $paymentMethod",
                    style: boldTextStyle.copyWith(
                      color: darkBlueColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  "886234803",
                  style: semiBoldTextStyle.copyWith(
                    fontSize: 32,
                    color: darkBlueColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "PAYMENT CODE",
                  style: mediumTextStyle,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "NOMINAL TRANSFER",
                style: mediumTextStyle,
              ),
              Text(
                "Rp. 1000000",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 20,
                  color: darkBlueColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "TRANSFER SEBELUM",
                style: mediumTextStyle,
              ),
              Text(
                "24 May 2024 12:59:59",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 20,
                  color: darkBlueColor,
                ),
              ),
              const SizedBox(height: 30),
              CustomFilledButtonWidget(
                buttonTitle: "Check Payment",
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              CustomFilledButtonWidget(
                buttonTitle: "Pay Later",
                buttonColor: Colors.grey,
                buttonTitleColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
