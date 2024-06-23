import 'package:flutter/material.dart';
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
        ],
      ),
    );
  }
}
