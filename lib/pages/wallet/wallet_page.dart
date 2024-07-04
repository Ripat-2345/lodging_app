import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/pages/top_up/top_up_page.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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
          'My Wallet',
          style: semiBoldTextStyle.copyWith(
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 160,
              margin: const EdgeInsets.only(
                left: 22,
                top: 10,
                right: 22,
                bottom: 22,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    blueColor,
                    darkBlueColor,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Saldo',
                    style: mediumTextStyle.copyWith(
                      color: whiteColor,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Rp. 1500000',
                    style: boldTextStyle.copyWith(
                      color: whiteColor,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  CustomFilledButtonWidget(
                    buttonTitle: "Top Up",
                    width: 120,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TopUpPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.8,
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
                  Text(
                    "History Transaction",
                    style: semiBoldTextStyle.copyWith(
                      color: darkBlueColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Card(
                        color: whiteColor,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transaction Out",
                                    style: semiBoldTextStyle.copyWith(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Text(
                                    "20 may 2024 10:11:20",
                                    style: semiBoldTextStyle.copyWith(
                                      fontSize: 10,
                                      color: darkBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Text(
                                "-Rp. 1000000",
                                style: mediumTextStyle.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: whiteColor,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transaction In",
                                    style: semiBoldTextStyle.copyWith(
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    "20 may 2024 10:11:20",
                                    style: semiBoldTextStyle.copyWith(
                                      fontSize: 10,
                                      color: darkBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Text(
                                "Rp. 500000",
                                style: mediumTextStyle.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
