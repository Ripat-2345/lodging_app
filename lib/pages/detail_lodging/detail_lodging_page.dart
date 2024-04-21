import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/theme.dart';

class DetailLodgingPage extends StatefulWidget {
  const DetailLodgingPage({super.key});

  @override
  State<DetailLodgingPage> createState() => _DetailLodgingPageState();
}

class _DetailLodgingPageState extends State<DetailLodgingPage> {
  List<String> images = [
    'assets/images/lodging1.png',
    'assets/images/lodging2.png',
  ];

  String longText =
      'Set in Uluwatu, 100 metres from Cemongkak Beach, Terra Cottages Bali offers accommodation with an outdoor swimming pool, free private parking, a garden and a restaurant. 200 metres from Bingin Beach and 700 metres from Dreamland Beach, the property features a private beach area, as well as a bar.';

  bool isExpanded = false;

  List<String> reviews = [
    "Great place to stay! Amazing amenities and friendly staff.",
    "I had a wonderful time at Amnaya Resort Nusa Dua. Highly recommended!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 22,
            top: 50,
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
                    width: 34,
                    height: 34,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 34,
                        color: darkBlueColor,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                  SizedBox(
                    width: 34,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        size: 34,
                        color: darkBlueColor,
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
                    color: darkBlueColor,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Transform.scale(
                scale: 1.2,
                child: CarouselSlider(
                  items: images.map((item) {
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
                  color: darkBlueColor,
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
              const SizedBox(height: 20),
              Text(
                'Overview',
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isExpanded
                          ? longText
                          : '${longText.substring(0, 150)}...',
                      style: regularTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    // SizedBox(height: 4),
                    // if (longText.length > 150)
                    //   GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         isExpanded = !isExpanded;
                    //       });
                    //     },
                    //     child: Text(
                    //       isExpanded ? 'See Less' : 'See More',
                    //       style: TextStyle(
                    //         color: blueColor,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
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
                      color: darkBlueColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '(1k reviews)',
                    textAlign: TextAlign.start,
                    style: regularTextStyle.copyWith(
                      color: blueColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: blueColor,
                              radius: 20,
                              child: Icon(
                                Icons.person,
                                color: whiteColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index % 2 == 0
                                      ? 'Ripat Al Safar'
                                      : 'Erin Gunawan',
                                  style: TextStyle(
                                    color: blueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
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
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          reviews[index],
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
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomAppBar(
          color: darkBlueColor,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp 1,500,000.-',
                style: boldTextStyle.copyWith(
                  color: whiteColor,
                  fontSize: 20,
                ),
              ),
              CustomFilledButtonWidget(
                buttonTitle: "Reserve Now",
                width: 140,
                buttonTitleFontSize: 16,
                buttonTitleFontWeight: FontWeight.w500,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
