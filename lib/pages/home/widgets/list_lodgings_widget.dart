import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/pages/detail_lodging/detail_lodging_page.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class ListLodgingsWidget extends StatefulWidget {
  const ListLodgingsWidget({super.key});

  @override
  State<ListLodgingsWidget> createState() => _ListLodgingsWidgetState();
}

class _ListLodgingsWidgetState extends State<ListLodgingsWidget> {
  AppinioSwiperController appinioSwiperController = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Consumer<LodgingProvider>(
        builder: (context, lodgingProvider, child) {
          return AppinioSwiper(
            controller: appinioSwiperController,
            loop: true,
            cardCount: lodgingProvider.listLodgings.length,
            cardBuilder: (context, index) {
              List listFacilities =
                  lodgingProvider.listLodgings[index]['facilities'];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailLodgingPage(
                          detailLodging: lodgingProvider.listLodgings[index],
                        );
                      },
                    ),
                  );
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
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              lodgingProvider.listLodgings[index]
                                  ['lodging_images'][0],
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
                                onPressed: () {
                                  lodgingProvider.setIsFavoriteLodging(
                                    lodgingProvider.listLodgings[index]
                                        ["is_favorite"],
                                    lodgingProvider.listLodgings[index]
                                        ["lodging_name"],
                                  );
                                },
                                icon: lodgingProvider.listLodgings[index]
                                        ["is_favorite"]
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.redAccent,
                                        size: 24,
                                      )
                                    : Icon(
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
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Text(
                                    lodgingProvider.listLodgings[index]
                                        ["lodging_name"],
                                    style: semiBoldTextStyle.copyWith(
                                      color: darkBlueColor,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                                      lodgingProvider.listLodgings[index]
                                          ['rating'],
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
                              children:
                                  listFacilities.sublist(0, 3).map((data) {
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
                              "Rp.${lodgingProvider.listLodgings[index]['price'].toString()}",
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
