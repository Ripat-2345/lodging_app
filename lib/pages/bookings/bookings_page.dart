import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/providers/booking_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bookingProvider = Provider.of<BookingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 5),
            ImageIcon(
              const AssetImage("assets/icons/booking_icon.png"),
              color: context.read<ThemeProvider>().themeApp
                  ? darkBlueColor
                  : whiteColor,
              size: 32,
            ),
            const SizedBox(width: 5),
            Text(
              "Recent Bookings",
              style: semiBoldTextStyle.copyWith(
                color: context.read<ThemeProvider>().themeApp
                    ? darkBlueColor
                    : whiteColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 22,
          top: 10,
          right: 22,
          bottom: 10,
        ),
        child: Column(
          children: bookingProvider.listBookings.map((data) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: context.read<ThemeProvider>().themeApp
                          ? darkBlueColor
                          : whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['lodging_name'],
                          style: mediumTextStyle.copyWith(
                            color: context.read<ThemeProvider>().themeApp
                                ? yellowColor
                                : darkBlueColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          data['lodging_location'],
                          style: lightTextStyle.copyWith(
                            color: context.read<ThemeProvider>().themeApp
                                ? whiteColor
                                : Colors.black,
                            fontSize: 12,
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
                                    color:
                                        context.read<ThemeProvider>().themeApp
                                            ? yellowColor
                                            : darkBlueColor,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  data['check_in'],
                                  style: lightTextStyle.copyWith(
                                    color:
                                        context.read<ThemeProvider>().themeApp
                                            ? whiteColor
                                            : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "2 June, 2024",
                                  style: lightTextStyle.copyWith(
                                    color:
                                        context.read<ThemeProvider>().themeApp
                                            ? whiteColor
                                            : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 30,
                              width: 1,
                              decoration: BoxDecoration(
                                color: context.read<ThemeProvider>().themeApp
                                    ? whiteColor
                                    : darkBlueColor,
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
                                    color:
                                        context.read<ThemeProvider>().themeApp
                                            ? yellowColor
                                            : darkBlueColor,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  data['check_out'],
                                  style: lightTextStyle.copyWith(
                                    color:
                                        context.read<ThemeProvider>().themeApp
                                            ? whiteColor
                                            : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "14 June, 2024",
                                  style: lightTextStyle.copyWith(
                                    color:
                                        context.read<ThemeProvider>().themeApp
                                            ? whiteColor
                                            : Colors.black,
                                    fontSize: 12,
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
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rp ${data['total_pay']}",
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
          }).toList(),
        ),
      ),
    );
  }
}
