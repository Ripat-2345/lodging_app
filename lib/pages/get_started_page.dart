import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/theme.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  CarouselController carouselController = CarouselController();
  int _currentIndex = 0;

  final List _dataGetStarted = [
    [
      "assets/images/illustration2.png",
      "Mulailah petualangan Anda dengan mencari tempat menginap yang sempurna sesuai kebutuhan dan preferensi Anda."
    ],
    [
      "assets/images/illustration3.png",
      "Temukan penginapan impian Anda dengan mudah. Cukup masukkan lokasi, tanggal, dan preferensi Anda untuk menemukan pilihan terbaik."
    ],
    [
      "assets/images/illustration4.png",
      "Jelajahi berbagai pilihan penginapan yang nyaman dan terjangkau dengan mudah di aplikasi kami. Mulailah perjalanan tak terlupakan Anda sekarang!"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: Center(
        child: Container(
          width: double.infinity,
          height: 650,
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 60),
          padding: const EdgeInsets.only(
            left: 20,
            top: 40,
            right: 20,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: darkBlueColor,
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/lodging_app_icon.png",
                        width: 34,
                        height: 34,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Lodging",
                        style: semiBoldTextStyle.copyWith(
                          color: whiteColor,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CarouselSlider(
                items: _dataGetStarted.map((data) {
                  return Image.asset(
                    data[0],
                    width: 318,
                    height: 219,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 318,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
              SizedBox(
                height: 84,
                child: Center(
                  child: Text(
                    _dataGetStarted[_currentIndex][1],
                    style: semiBoldTextStyle.copyWith(color: darkBlueColor),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _dataGetStarted.map((data) {
                  return Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == _dataGetStarted.indexOf(data)
                          ? yellowColor
                          : blueColor,
                    ),
                  );
                }).toList(),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: _currentIndex == 2
                    ? CustomFilledButtonWidget(
                        buttonTitle: "Start Journey!",
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false,
                          );
                        },
                      )
                    : CustomFilledButtonWidget(
                        buttonTitle: "Next",
                        width: 160,
                        onPressed: () {
                          carouselController.nextPage();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
