import 'package:flutter/material.dart';
import 'package:lodging_app/pages/search/search_detail_page.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class CustomAppbarHomeWidget extends StatefulWidget {
  const CustomAppbarHomeWidget({super.key});

  @override
  State<CustomAppbarHomeWidget> createState() => _CustomAppbarHomeWidgetState();
}

class _CustomAppbarHomeWidgetState extends State<CustomAppbarHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 245,
      padding: const EdgeInsets.only(
        left: 22,
        top: 40,
        right: 22,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color:
            context.read<ThemeProvider>().themeApp ? darkBlueColor : blueColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    const AssetImage("assets/icons/lodging_app_icon.png"),
                    color: whiteColor,
                    size: 26,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Lodging",
                    style: semiBoldTextStyle.copyWith(
                      fontSize: 20,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  const AssetImage("assets/icons/notification_icon.png"),
                  color: whiteColor,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                "Hi Dino, tell us where you\nwant to stay!",
                style: mediumTextStyle.copyWith(
                  color: whiteColor,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/images/illustration1.png",
                width: 111,
                height: 85,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // search bar
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return DraggableScrollableSheet(
                    initialChildSize: 0.8,
                    maxChildSize: 1,
                    minChildSize: 0.5,
                    expand: false,
                    builder: (context, scrollController) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: const SearchDetailPage(),
                      );
                      // return const SearchDetailPage();
                    },
                  );
                  // return
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: 45,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 24,
                    color: darkBlueColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Search where will you stay....",
                    style: regularTextStyle.copyWith(
                      color: darkBlueColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
