import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class MostVisitedPlaceWidget extends StatefulWidget {
  const MostVisitedPlaceWidget({super.key});

  @override
  State<MostVisitedPlaceWidget> createState() => _MostVisitedPlaceWidgetState();
}

class _MostVisitedPlaceWidgetState extends State<MostVisitedPlaceWidget> {
  AppinioSwiperController appinioSwiperController = AppinioSwiperController();

  final List _mostVisitedPlace = [
    [
      "assets/images/lodging4.png",
      "S Resorts Hidden Valley Bali",
      ["3 bedrooms", "2 bathrooms", "1 pools"],
      "Rp 1,500,000.- ",
    ],
    [
      "assets/images/lodging5.png",
      "Harsono Boutique Resort Bali",
      ["6 bedrooms", "3 bathrooms", "1 pools"],
      "Rp 3,500,000.- ",
    ],
    [
      "assets/images/lodging6.png",
      "Bali Jungle Camping by Amerta",
      ["1 bedrooms", "1 bathrooms"],
      "Rp 1,000,000.- ",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: AppinioSwiper(
        controller: appinioSwiperController,
        loop: true,
        cardCount: _mostVisitedPlace.length,
        cardBuilder: (context, index) {
          List dataFacilites = _mostVisitedPlace[index][2];
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
                          _mostVisitedPlace[index][0],
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
                              _mostVisitedPlace[index][1],
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
                          _mostVisitedPlace[index][3],
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
      ),
    );
  }
}
