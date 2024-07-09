import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/pages/bookings/bookings_detail_page.dart';
import 'package:lodging_app/providers/booking_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  bool _loadingBookings = false;
  int _selectedFilterIndex = 0;

  void _onLoading() {
    setState(() {
      _loadingBookings = !_loadingBookings;
    });
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          _loadingBookings = !_loadingBookings;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _onLoading();
  }

  @override
  Widget build(BuildContext context) {
    var bookingProvider = Provider.of<BookingProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: AppBar(
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
                "Bookings",
                style: semiBoldTextStyle.copyWith(
                  color: context.read<ThemeProvider>().themeApp
                      ? darkBlueColor
                      : whiteColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 22,
                bottom: 10,
              ),
              child: Row(
                children: [
                  ChoiceChip(
                    label: Text(
                      'On Progress',
                      style: TextStyle(
                        color: darkBlueColor,
                      ),
                    ),
                    selected: _selectedFilterIndex == 0,
                    selectedColor: yellowColor,
                    onSelected: (_) {
                      setState(() {
                        _selectedFilterIndex = 0;
                      });
                      bookingProvider.statusBooking = 1;
                      _onLoading();
                    },
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: Text(
                      'Recent Bookings',
                      style: TextStyle(
                        color: darkBlueColor,
                      ),
                    ),
                    selected: _selectedFilterIndex == 1,
                    selectedColor: yellowColor,
                    onSelected: (_) {
                      setState(() {
                        _selectedFilterIndex = 1;
                      });
                      bookingProvider.statusBooking = 0;
                      _onLoading();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          left: 22,
          right: 22,
          bottom: 10,
        ),
        children: [
          _loadingBookings
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 3,
                    ),
                    child: CircularProgressIndicator(
                      color: darkBlueColor,
                    ),
                  ),
                )
              : Column(
                  children: bookingProvider.listBookings.reversed.map((data) {
                    if (data['status_booking'] ==
                        bookingProvider.statusBooking) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data['status_booking'] == 0
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        color: blueColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Completed",
                                          style: boldTextStyle.copyWith(
                                            color: whiteColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(10),
                                    topRight: data['status_booking'] == 1
                                        ? const Radius.circular(10)
                                        : const Radius.circular(0)),
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
                                      color:
                                          context.read<ThemeProvider>().themeApp
                                              ? yellowColor
                                              : darkBlueColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    data['lodging_location'],
                                    style: lightTextStyle.copyWith(
                                      color:
                                          context.read<ThemeProvider>().themeApp
                                              ? whiteColor
                                              : Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Check-in",
                                            style: mediumTextStyle.copyWith(
                                              color: context
                                                      .read<ThemeProvider>()
                                                      .themeApp
                                                  ? yellowColor
                                                  : darkBlueColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            DateFormat("Hms").format(
                                              DateTime.parse(data['check_in']),
                                            ),
                                            style: lightTextStyle.copyWith(
                                              color: context
                                                      .read<ThemeProvider>()
                                                      .themeApp
                                                  ? whiteColor
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            DateFormat("d MMMM y").format(
                                              DateTime.parse(data['check_in']),
                                            ),
                                            style: lightTextStyle.copyWith(
                                              color: context
                                                      .read<ThemeProvider>()
                                                      .themeApp
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
                                          color: context
                                                  .read<ThemeProvider>()
                                                  .themeApp
                                              ? whiteColor
                                              : darkBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Check-out",
                                            style: mediumTextStyle.copyWith(
                                              color: context
                                                      .read<ThemeProvider>()
                                                      .themeApp
                                                  ? yellowColor
                                                  : darkBlueColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            DateFormat("Hms").format(
                                              DateTime.parse(data['check_out']),
                                            ),
                                            style: lightTextStyle.copyWith(
                                              color: context
                                                      .read<ThemeProvider>()
                                                      .themeApp
                                                  ? whiteColor
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            DateFormat("d MMMM y").format(
                                              DateTime.parse(data['check_out']),
                                            ),
                                            style: lightTextStyle.copyWith(
                                              color: context
                                                      .read<ThemeProvider>()
                                                      .themeApp
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BookingsDetailPage(
                                            detailBooking: data,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }).toList(),
                ),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
