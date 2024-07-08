import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_text_button_widget.dart';
import 'package:lodging_app/pages/home/widgets/custom_appbar_home_widget.dart';
import 'package:lodging_app/pages/home/widgets/list_lodgings_widget.dart';
import 'package:lodging_app/pages/home/widgets/popular_lodgings_widget.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNewUser = true;

  void showNewUserDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: darkBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.discount, color: whiteColor),
              const SizedBox(height: 10),
              Text(
                'Get 20% off as new user on your first booking.',
                style: regularTextStyle.copyWith(
                  color: whiteColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButtonWidget(
                    title: "Dismiss",
                    titleColor: yellowColor,
                    titleFontSize: 14,
                    titleFontWeight: FontWeight.w400,
                    isUnderline: false,
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        isNewUser = false;
                      });
                    },
                  ),
                  CustomTextButtonWidget(
                    title: "Find Lodgings",
                    titleColor: yellowColor,
                    titleFontSize: 14,
                    titleFontWeight: FontWeight.w400,
                    isUnderline: false,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isNewUser) {
        showNewUserDialog(context);
      }
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppbarHomeWidget(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular lodgings",
                textAlign: TextAlign.left,
                style: semiBoldTextStyle.copyWith(
                  color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const PopularLodgingsWidget(),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "Find your lodgings",
                textAlign: TextAlign.left,
                style: semiBoldTextStyle.copyWith(
                  color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const ListLodgingsWidget(),
          const SizedBox(height: 140),
        ],
      ),
    );
  }
}
