import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class PopularLodgingsWidget extends StatefulWidget {
  const PopularLodgingsWidget({super.key});

  @override
  State<PopularLodgingsWidget> createState() => _PopularLodgingsWidgetState();
}

class _PopularLodgingsWidgetState extends State<PopularLodgingsWidget> {
  final List _popularLodgings = [
    ["Terra Cottages Bali", "assets/images/lodging1.png"],
    ["ONAYA Bali Resort", "assets/images/lodging2.png"],
    ["Uluwatu Breeze Village", "assets/images/lodging3.png"],
    ["Terra Cottages Bali", "assets/images/lodging1.png"],
    ["ONAYA Bali Resort", "assets/images/lodging2.png"],
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Row(
          children: _popularLodgings.map((dataPopularLodging) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail-lodging');
              },
              child: Container(
                width: 100,
                height: 140,
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(dataPopularLodging[1]),
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 140,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: darkBlueColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      dataPopularLodging[0],
                      style: semiBoldTextStyle.copyWith(
                        color: whiteColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
