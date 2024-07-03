import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/pages/payment/payment_success_page.dart';
import 'package:lodging_app/pages/payment/payment_transfer_page.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  final Map dataBooking;
  const PaymentPage({super.key, required this.dataBooking});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _paymentMethod = "";

  void _validateMsgPaymentForm(String msg) {
    var snackBar = SnackBar(
      content: Text(
        msg,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'Payment Lodging',
          style: semiBoldTextStyle.copyWith(
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
            fontSize: 20,
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
            bottom: 22,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your reservation",
                style: boldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.dataBooking['lodging_name'],
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                widget.dataBooking['lodging_location'],
                style: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check In",
                            style: semiBoldTextStyle.copyWith(
                              color: darkBlueColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.calendar_month_rounded,
                                color: darkBlueColor,
                                size: 24,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat("d MMM y").format(
                                  DateTime.parse(
                                    widget.dataBooking['check_in'],
                                  ),
                                ),
                                style: mediumTextStyle.copyWith(
                                  color: blueColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Duration",
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.dataBooking['duration'],
                        style: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check Out",
                            style: semiBoldTextStyle.copyWith(
                              color: darkBlueColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.calendar_month_rounded,
                                color: darkBlueColor,
                                size: 24,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat("d MMM y").format(
                                  DateTime.parse(
                                    widget.dataBooking['check_out'],
                                  ),
                                ),
                                style: mediumTextStyle.copyWith(
                                  color: blueColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "People stay",
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${widget.dataBooking['count_people_stay'].toString()} people",
                        style: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Total Payment",
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Rp. ${widget.dataBooking['total_pay'].toString()}",
                style: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Text(
                "Payment method",
                style: boldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              DropdownMenu(
                width: MediaQuery.of(context).size.width / 1.27,
                label: Text("Choose method", style: mediumTextStyle),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                trailingIcon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: darkBlueColor,
                ),
                initialSelection: _paymentMethod,
                onSelected: (value) {
                  setState(() {
                    _paymentMethod = value!;
                  });
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: "WALLET",
                    label: "My Wallet",
                    labelWidget: Text(
                      "My Wallet",
                      style: mediumTextStyle,
                    ),
                  ),
                  DropdownMenuEntry(
                    value: "MANDIRI",
                    label: "Mandiri",
                    labelWidget: Text(
                      "Mandiri",
                      style: mediumTextStyle,
                    ),
                  ),
                  DropdownMenuEntry(
                    value: "BCA",
                    label: "BCA",
                    labelWidget: Text(
                      "BCA",
                      style: mediumTextStyle,
                    ),
                  ),
                  DropdownMenuEntry(
                    value: "BRI",
                    label: "BRI",
                    labelWidget: Text(
                      "BRI",
                      style: mediumTextStyle,
                    ),
                  ),
                ],
              ),
              if (_paymentMethod == "WALLET")
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        "Saldo:",
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Rp 5000000",
                        style: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 30),
              CustomFilledButtonWidget(
                buttonTitle: "Pay Now",
                onPressed: () {
                  if (_paymentMethod.isNotEmpty) {
                    if (_paymentMethod == "WALLET") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const PaymentSuccessPage();
                        }),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentTransferPage(
                            paymentMethod: _paymentMethod,
                          ),
                        ),
                      );
                    }
                  } else {
                    _validateMsgPaymentForm("Pilih metode pembayaran!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
