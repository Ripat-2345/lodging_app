import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile",
        style: semiBoldTextStyle.copyWith(fontSize: 28, color: darkBlueColor),
      ),
    );
  }
}
