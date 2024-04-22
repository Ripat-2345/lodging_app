import 'package:flutter/material.dart';
import 'package:lodging_app/pages/home/widgets/custom_appbar_home_widget.dart';
import 'package:lodging_app/pages/home/widgets/most_visited_place_widget.dart';
import 'package:lodging_app/pages/home/widgets/popular_lodgings_widget.dart';
import 'package:lodging_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // todo: custom appbar home
          const CustomAppbarHomeWidget(),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // todo: popular lodgings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Popular lodgings",
                      textAlign: TextAlign.left,
                      style: semiBoldTextStyle.copyWith(
                        color: darkBlueColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'See More',
                      textAlign: TextAlign.start,
                      style: mediumTextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const PopularLodgingsWidget(),
              const SizedBox(height: 20),

              // todo: most visited place
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Most visited place",
                      textAlign: TextAlign.left,
                      style: semiBoldTextStyle.copyWith(
                        color: darkBlueColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'See More',
                      textAlign: TextAlign.start,
                      style: mediumTextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const MostVisitedPlaceWidget(),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
