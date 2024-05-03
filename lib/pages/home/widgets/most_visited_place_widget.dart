import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/providers/home_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class MostVisitedPlaceWidget extends StatefulWidget {
  const MostVisitedPlaceWidget({super.key});

  @override
  State<MostVisitedPlaceWidget> createState() => _MostVisitedPlaceWidgetState();
}

class _MostVisitedPlaceWidgetState extends State<MostVisitedPlaceWidget> {
  AppinioSwiperController appinioSwiperController = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return AppinioSwiper(
            controller: appinioSwiperController,
            loop: true,
            cardCount: homeProvider.mostVisitedPlace.length,
            cardBuilder: (context, index) {
              List dataFacilites = homeProvider.mostVisitedPlace[index][2];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-lodging');
                },
                child: Container(
                  width: double.infinity,
                  height: 260,
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              homeProvider.mostVisitedPlace[index][0],
                              width: double.infinity,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 17,
                            right: 17,
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  color: whiteColor,
                                  size: 24,
                                ),
                                padding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeProvider.mostVisitedPlace[index][1],
                                  style: semiBoldTextStyle.copyWith(
                                    color: darkBlueColor,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      size: 18,
                                      color: yellowColor,
                                    ),
                                    Text(
                                      "4.8(1k)",
                                      style: mediumTextStyle.copyWith(
                                        color: darkBlueColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: dataFacilites.map((data) {
                                return Row(
                                  children: [
                                    Text(
                                      data,
                                      style: mediumTextStyle.copyWith(
                                        color: blueColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              homeProvider.mostVisitedPlace[index][3],
                              style: boldTextStyle.copyWith(
                                color: darkBlueColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
