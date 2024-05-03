import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class SearchDetailPage extends StatelessWidget {
  const SearchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 45,
          child: TextField(
            autofocus: true,
            style: mediumTextStyle.copyWith(color: darkBlueColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: darkBlueColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: darkBlueColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 24,
                color: darkBlueColor,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
