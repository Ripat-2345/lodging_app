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
    final List listImages = detailBooking['lodging_images'];
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
              Center(
                child: Text(
                  "Scan QRCode for reservation",
                  style: semiBoldTextStyle.copyWith(
                      color: darkBlueColor, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 220,
                  height: 220,
                  child: SfBarcodeGenerator(
                    value: detailBooking['id_booking'].toString(),
                    symbology: QRCode(),
                    barColor: darkBlueColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Your lodging",
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                detailBooking['lodging_name'],
                style: regularTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                detailBooking['lodging_location'],
                style: regularTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listImages.map((img) {
                    return Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
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
              CustomFilledButtonWidget(
                buttonTitle: "Cancel",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
