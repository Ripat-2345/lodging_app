import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_text_button_widget.dart';
import 'package:lodging_app/pages/home/widgets/custom_appbar_home_widget.dart';
import 'package:lodging_app/pages/home/widgets/most_visited_place_widget.dart';
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
  @override
  void initState() {
    super.initState();
    // todo: hide banner discount for new user
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        if (isNewUser) {
          setState(() {
            isNewUser = !isNewUser;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          // todo: custom appbar home
          const CustomAppbarHomeWidget(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: isNewUser
                // todo: banner discount for new user
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MaterialBanner(
                      content: Text(
                        'Get 20% off on your first booking.',
                        style: regularTextStyle.copyWith(
                          color: whiteColor,
                          fontSize: 16,
                        ),
                      ),
                      leading: Icon(Icons.discount, color: whiteColor),
                      backgroundColor: darkBlueColor,
                      actions: [
                        CustomTextButtonWidget(
                          title: "Dismiss",
                          titleColor: yellowColor,
                          titleFontSize: 14,
                          titleFontWeight: FontWeight.w400,
                          isUnderline: false,
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                            setState(() {
                              isNewUser = !isNewUser;
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
                  )
                : const SizedBox(),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // todo: popular lodgings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Popular lodgings",
                      textAlign: TextAlign.left,
                      style: semiBoldTextStyle.copyWith(
                        color:
                            themeProvider.themeApp ? darkBlueColor : whiteColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'See More',
                      textAlign: TextAlign.start,
                      style: mediumTextStyle.copyWith(
                        color: themeProvider.themeApp ? blueColor : yellowColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const PopularLodgingsWidget(),
              const SizedBox(height: 20),

              // todo: most visited place
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Most visited place",
                      textAlign: TextAlign.left,
                      style: semiBoldTextStyle.copyWith(
                        color:
                            themeProvider.themeApp ? darkBlueColor : whiteColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'See More',
                      textAlign: TextAlign.start,
                      style: mediumTextStyle.copyWith(
                        color: themeProvider.themeApp ? blueColor : yellowColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const MostVisitedPlaceWidget(),
              const SizedBox(height: 30),
            ],
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
