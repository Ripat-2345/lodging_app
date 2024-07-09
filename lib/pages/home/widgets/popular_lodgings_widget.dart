import 'package:flutter/material.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class PopularLodgingsWidget extends StatefulWidget {
  const PopularLodgingsWidget({super.key});

  @override
  State<PopularLodgingsWidget> createState() => _PopularLodgingsWidgetState();
}

class _PopularLodgingsWidgetState extends State<PopularLodgingsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Consumer<LodgingProvider>(
          builder: (context, lodgingProvider, child) {
            return Row(
              children: lodgingProvider.listLodgings
                  .getRange(0, 6)
                  .map((dataPopularLodging) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/detail-lodging');
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
                        image: AssetImage(
                          dataPopularLodging["lodging_images"][0],
                        ),
                        fit: BoxFit.cover,
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
                        color: context.read<ThemeProvider>().themeApp
                            ? darkBlueColor.withOpacity(0.2)
                            : yellowColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          dataPopularLodging["lodging_name"],
                          style: semiBoldTextStyle.copyWith(
                            color: whiteColor,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
