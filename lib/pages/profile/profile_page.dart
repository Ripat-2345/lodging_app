import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 5),
            ImageIcon(
              const AssetImage("assets/icons/profile_icon.png"),
              color: darkBlueColor,
              size: 32,
            ),
            const SizedBox(width: 5),
            Text(
              "User Profile",
              style: semiBoldTextStyle.copyWith(
                color: darkBlueColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 22,
          top: 10,
          right: 22,
          bottom: 10,
        ),
        child: Container(
          width: double.infinity,
          height: 567,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
