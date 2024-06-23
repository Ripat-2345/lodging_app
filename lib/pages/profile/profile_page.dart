import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
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
    ["assets/icons/edit_user_icon.png", "Edit Profile"],
    ["assets/icons/wallet_icon.png", "Wallet Settings"],
    ["assets/icons/help_icon.png", "Help Center"],
    ["assets/icons/logout_icon.png", "Log Out"],
  ];

  @override
  void initState() {
    super.initState();
    _snackbarMessageCompletedProfile();
  }

  // todo: banner message completed profile
  _snackbarMessageCompletedProfile() {
    var snackBar = SnackBar(
      content: Text(
        "Please completed your profile!",
        style: mediumTextStyle.copyWith(
          color: darkBlueColor,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: yellowColor,
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
      action: SnackBarAction(
        label: 'Got it',
        textColor: blueColor,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
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
