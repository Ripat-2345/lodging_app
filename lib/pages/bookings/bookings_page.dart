import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/theme.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        top: 60,
        right: 22,
        bottom: 10,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ImageIcon(
                const AssetImage("assets/icons/booking_icon.png"),
                color: darkBlueColor,
                size: 32,
              ),
              const SizedBox(width: 5),
              Text(
                "Recent Bookings",
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 130,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkBlueColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Amnaya Resort Nusa Dua",
                              style: mediumTextStyle.copyWith(
                                color: yellowColor,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Jalan Pratama Gang Welaka no 8, Tanjung Benoa, Nusa Dua, Bali, 80363 Nusa Dua, Indonesia",
                              style: lightTextStyle.copyWith(
                                color: whiteColor,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check-in",
                                      style: mediumTextStyle.copyWith(
                                        color: yellowColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "10:00 AM",
                                      style: lightTextStyle.copyWith(
                                        color: whiteColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "2 June, 2024",
                                      style: lightTextStyle.copyWith(
                                        color: whiteColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 30,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check-out",
                                      style: mediumTextStyle.copyWith(
                                        color: yellowColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "10:00 AM",
                                      style: lightTextStyle.copyWith(
                                        color: whiteColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "14 June, 2024",
                                      style: lightTextStyle.copyWith(
                                        color: whiteColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.symmetric(
                          vertical: 9,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Rp 2.500.000.-",
                              style: semiBoldTextStyle.copyWith(
                                color: whiteColor,
                                fontSize: 20,
                              ),
                            ),
                            CustomFilledButtonWidget(
                              width: 100,
                              height: 28,
                              buttonTitleFontSize: 14,
                              buttonTitleFontWeight: FontWeight.w500,
                              buttonTitle: "Details",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
