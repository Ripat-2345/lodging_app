import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/pages/reserve/reserve_lodging_page.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class DetailLodgingPage extends StatefulWidget {
  final Map detailLodging;
  const DetailLodgingPage({super.key, required this.detailLodging});

  @override
  State<DetailLodgingPage> createState() => _DetailLodgingPageState();
}

class _DetailLodgingPageState extends State<DetailLodgingPage> {
  bool isExpanded = false;

  List _lodgingImages = [];
  List _facilities = [];
  List _reviewUsers = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _lodgingImages = widget.detailLodging['lodging_images'];
      _facilities = widget.detailLodging['facilities'];
      _reviewUsers = widget.detailLodging['reviews'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var lodgingProvider = Provider.of<LodgingProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 22,
            top: 40,
            right: 22,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 28,
                        color:
                            themeProvider.themeApp ? darkBlueColor : whiteColor,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                    child: IconButton(
                      onPressed: () {
                        lodgingProvider.setIsFavoriteLodging(
                          widget.detailLodging["is_favorite"],
                          widget.detailLodging["lodging_name"],
                        );
                      },
                      icon: widget.detailLodging['is_favorite']
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                              size: 28,
                            )
                          : Icon(
                              Icons.favorite_border_rounded,
                              size: 28,
                              color: themeProvider.themeApp
                                  ? darkBlueColor
                                  : whiteColor,
                            ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  widget.detailLodging['lodging_name'],
                  style: semiBoldTextStyle.copyWith(
                    color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                    fontSize: 20,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 40),
              Transform.scale(
                scale: 1.2,
                child: CarouselSlider(
                  items: _lodgingImages.map((item) {
                    return SizedBox(
                      width: 346,
                      height: 240,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Overview',
                style: semiBoldTextStyle.copyWith(
                  color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.detailLodging['overview'],
                        style: regularTextStyle.copyWith(color: Colors.black),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    ),
                    const SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'Read Less' : 'Read More',
                        style: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Facilities',
                style: semiBoldTextStyle.copyWith(
                  color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                  fontSize: 16,
                ),
              ),
              Wrap(
                spacing: 5,
                runSpacing: 0,
                children: _facilities.map((dataFacilities) {
                  return Chip(
                    padding: const EdgeInsets.all(2),
                    label: Text(
                      dataFacilities,
                      style: mediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                    side: BorderSide.none,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Reviews',
                    textAlign: TextAlign.start,
                    style: semiBoldTextStyle.copyWith(
                      color:
                          themeProvider.themeApp ? darkBlueColor : whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'See More',
                    textAlign: TextAlign.start,
                    style: regularTextStyle.copyWith(
                      color: themeProvider.themeApp ? blueColor : yellowColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                children: _reviewUsers.map(
                  (review) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  review['user_pict'],
                                  width: 36,
                                  height: 36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review['username'],
                                    style: mediumTextStyle.copyWith(
                                      color: blueColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        review['rating'],
                                        style: mediumTextStyle.copyWith(
                                          color: darkBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            review['comment'],
                            style: regularTextStyle,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price:",
                    style: mediumTextStyle.copyWith(
                      color: whiteColor,
                    ),
                  ),
                  Text(
                    'Rp ${widget.detailLodging['price'].toString()} / night',
                    style: boldTextStyle.copyWith(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              CustomFilledButtonWidget(
                buttonTitle: "Reserve",
                width: 120,
                buttonTitleFontSize: 16,
                buttonTitleFontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReserveLodgingPage(
                        idLodging: widget.detailLodging['id_lodging'],
                        lodgingName: widget.detailLodging['lodging_name'],
                        lodgingLocation:
                            widget.detailLodging['lodging_location'],
                        price: widget.detailLodging['price'],
                        lodgingImage: _lodgingImages.first,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
