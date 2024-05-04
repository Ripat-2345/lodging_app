import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List _listMenuProfile = [
    ["assets/icons/edit_user_icon.png", "Edit Profile"],
    ["assets/icons/wallet_icon.png", "Wallet Settings"],
    ["assets/icons/help_icon.png", "Help Center"],
    ["assets/icons/logout_icon.png", "Log Out"],
  ];

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
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/dino.PNG"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Dino",
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "dinowahyu@gmail.com",
                style: regularTextStyle.copyWith(color: blueColor),
              ),
              const SizedBox(height: 20),
              Column(
                children: _listMenuProfile.map((data) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ),
                    leading: ImageIcon(
                      AssetImage(data[0]),
                      size: 24,
                      color: darkBlueColor,
                    ),
                    title: Text(
                      data[1],
                      style: mediumTextStyle.copyWith(color: darkBlueColor),
                    ),
                    onTap: () {},
                  );
                }).toList(),
              ),
              const Spacer(),
              Text(
                "Version 1.0.1",
                style: regularTextStyle.copyWith(color: darkBlueColor),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
