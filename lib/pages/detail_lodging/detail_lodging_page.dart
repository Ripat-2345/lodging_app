import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/pages/reserve/reserve_lodging_page.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class DetailLodgingPage extends StatefulWidget {
  const DetailLodgingPage({super.key});

  @override
  State<DetailLodgingPage> createState() => _DetailLodgingPageState();
}

class _DetailLodgingPageState extends State<DetailLodgingPage> {
  final List<String> _images = [
    'assets/images/lodging1.png',
    'assets/images/lodging2.png',
  ];

  final String _overView =
      'Set in Uluwatu, 100 metres from Cemongkak Beach, Terra Cottages Bali offers accommodation with an outdoor swimming pool, free private parking, a garden and a restaurant. 200 metres from Bingin Beach and 700 metres from Dreamland Beach, the property features a private beach area, as well as a bar.';

  bool isExpanded = false;

  final List _reviewUsers = [
    [
      "assets/images/user1.png",
      "Uding Pancong",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "1 days ago",
    ],
    [
      "assets/images/user2.png",
      "Iqbal Syah Aja",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "3 months ago",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        size: 28,
                        color:
                            themeProvider.themeApp ? darkBlueColor : whiteColor,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  'Amnaya Resort Nusa Dua',
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
                  items: _images.map((item) {
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
                'Facilities',
                style: semiBoldTextStyle.copyWith(
                  color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                  fontSize: 16,
                ),
              ),
              Wrap(
                spacing: 5,
                runSpacing: 0,
                children: [
                  Chip(
                    padding: const EdgeInsets.all(2),
                    label: Text(
                      '3 Bedroom',
                      style: mediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                    side: BorderSide.none,
                  ),
                  Chip(
                    padding: const EdgeInsets.all(2),
                    label: Text(
                      '2 Bathroom',
                      style: mediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                    side: BorderSide.none,
                  ),
                  Chip(
                    padding: const EdgeInsets.all(2),
                    label: Text(
                      '1 Pool',
                      style: mediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                    side: BorderSide.none,
                  ),
                  Chip(
                    padding: const EdgeInsets.all(2),
                    label: Text(
                      'Parking',
                      style: mediumTextStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                    side: BorderSide.none,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Overview',
                style: semiBoldTextStyle.copyWith(
                  color: themeProvider.themeApp ? darkBlueColor : whiteColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Text(
                        _overView,
                        style: regularTextStyle.copyWith(
                          color: themeProvider.themeApp
                              ? Colors.black
                              : whiteColor,
                        ),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'Read Less' : 'Read More',
                        style: regularTextStyle.copyWith(
                          color:
                              themeProvider.themeApp ? blueColor : yellowColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
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
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: _reviewUsers.length,
                itemBuilder: (BuildContext context, int index) {
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
                                _reviewUsers[index][0],
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _reviewUsers[index][1],
                                  style: regularTextStyle.copyWith(
                                    color: blueColor,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star_half,
                                      color: yellowColor,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              _reviewUsers[index][3],
                              style: mediumTextStyle.copyWith(
                                color: darkBlueColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _reviewUsers[index][2],
                          style: regularTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  );
                },
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
                    'Rp 1,500,000.-',
                    style: boldTextStyle.copyWith(
                      color: whiteColor,
                      fontSize: 20,
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
                      builder: (context) => const ReserveLodgingPage(),
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
