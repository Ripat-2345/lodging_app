import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Bookings",
          style: semiBoldTextStyle.copyWith(fontSize: 28, color: darkBlueColor),
        ),
      ),
    );
  }
}
