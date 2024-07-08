import 'dart:io';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/pages/help_center/help_center_page.dart';
import 'package:lodging_app/pages/profile/edit_profile_page.dart';
import 'package:lodging_app/pages/wallet/wallet_page.dart';
import 'package:lodging_app/providers/auth_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List _listMenuProfile = [
    ["assets/icons/edit_user_icon.png", "Edit Profile", 'profile'],
    ["assets/icons/wallet_icon.png", "My Wallet", 'wallet'],
    ["assets/icons/help_icon.png", "Help Center", 'help_center'],
    ["assets/icons/logout_icon.png", "Log Out", 'logout'],
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 5),
                ImageIcon(
                  const AssetImage("assets/icons/profile_icon.png"),
                  color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                  size: 32,
                ),
                const SizedBox(width: 5),
                Text(
                  "User Profile",
                  style: semiBoldTextStyle.copyWith(
                    color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Spacer(),
            AnimatedToggleSwitch<bool>.dual(
              current: themeProvider.themeApp,
              first: false,
              second: true,
              spacing: 5.0,
              style: const ToggleStyle(
                borderColor: Colors.transparent,
              ),
              borderWidth: 4.0,
              height: 40,
              onChanged: (value) => setState(
                () => themeProvider.themeApp = value,
              ),
              styleBuilder: (value) => ToggleStyle(
                backgroundColor: value ? whiteColor : blueColor,
                indicatorColor: value ? darkBlueColor : whiteColor,
              ),
              iconBuilder: (value) => value
                  ? Icon(
                      Icons.light_mode_rounded,
                      size: 20,
                      color: whiteColor,
                    )
                  : Icon(
                      Icons.dark_mode_rounded,
                      size: 20,
                      color: blueColor,
                    ),
              textBuilder: (value) => value
                  ? Center(
                      child: Text(
                        'Ligth',
                        style: mediumTextStyle.copyWith(
                          fontSize: 14,
                          color: darkBlueColor,
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        'Dark',
                        style: mediumTextStyle.copyWith(
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                    ),
            )
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: darkBlueColor),
                ),
                child: authProvider.userAuth['user_pict'].isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          File(authProvider.userAuth['user_pict']),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(
                        child: ImageIcon(
                          const AssetImage("assets/icons/profile_icon.png"),
                          color: darkBlueColor,
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              Text(
                authProvider.userAuth['username'],
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                authProvider.userAuth['email'],
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
                    onTap: () {
                      switch (data[2]) {
                        case 'profile':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfilePage(),
                            ),
                          );
                          break;
                        case 'wallet':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WalletPage(),
                            ),
                          );
                          break;
                        case 'help_center':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelpCenterPage(),
                            ),
                          );
                          break;
                        case 'logout':
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/login",
                            (route) => false,
                          );
                          break;
                        default:
                      }
                    },
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
