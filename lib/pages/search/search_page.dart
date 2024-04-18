import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Search",
        style: semiBoldTextStyle.copyWith(fontSize: 28, color: darkBlueColor),
      ),
    );
  }
}
