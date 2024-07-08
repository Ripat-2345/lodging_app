import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BookingsDetailPage extends StatelessWidget {
  final Map detailBooking;
  const BookingsDetailPage({super.key, required this.detailBooking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Booking",
          style: semiBoldTextStyle.copyWith(
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 28,
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: 22,
            top: 10,
            right: 22,
            bottom: 10,
          ),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailBooking['status_booking'] == 1
                  ? Center(
                      child: Text(
                        "Scan QRCode for reservation",
                        style: semiBoldTextStyle.copyWith(
                            color: darkBlueColor, fontSize: 16),
                      ),
                    )
                  : Center(
                      child: Text(
                        "Your booking is completed\nThank you for visiting",
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
              const SizedBox(height: 20),
              detailBooking['status_booking'] == 1
                  ? Center(
                      child: SizedBox(
                        width: 220,
                        height: 220,
                        child: SfBarcodeGenerator(
                          value: detailBooking['id_booking'].toString(),
                          symbology: QRCode(),
                          barColor: darkBlueColor,
                        ),
                      ),
                    )
                  : const SizedBox(),
              detailBooking['status_booking'] == 1
                  ? const SizedBox(height: 30)
                  : const SizedBox(),
              Text(
                detailBooking['lodging_name'],
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                detailBooking['lodging_location'],
                style: regularTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Check in - Check out",
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: darkBlueColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat("d MMMM y").format(
                          DateTime.parse(detailBooking['check_in']),
                        ),
                        style: regularTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 10,
                    height: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: darkBlueColor,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: darkBlueColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat("d MMMM y").format(
                          DateTime.parse(detailBooking['check_out']),
                        ),
                        style: regularTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Duration stay",
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        detailBooking['duration'],
                        style: regularTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 36),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "People stay",
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${detailBooking['count_people_stay'].toString()} people",
                        style: regularTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Total payment",
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Rp.${detailBooking['total_pay'].toString()}",
                style: regularTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Payment method",
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                detailBooking['payment_method'],
                style: regularTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 20),
              detailBooking['status_booking'] == 1
                  ? CustomFilledButtonWidget(
                      buttonTitle: "Cancel",
                      onPressed: () {},
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              CustomFilledButtonWidget(
                buttonTitle: "Print Invoice",
                buttonColor: Colors.grey,
                buttonTitleColor: whiteColor,
                onPressed: () {
                  var snackBar = SnackBar(
                    content: Text(
                      "Invoice has been downloaded!",
                      style: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                      ),
                    ),
                    duration: const Duration(seconds: 2),
                    backgroundColor: yellowColor,
                    behavior: SnackBarBehavior.floating,
                    shape: const StadiumBorder(),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
