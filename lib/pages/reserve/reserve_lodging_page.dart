import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lodging_app/common_widgets/custom_date_picker_widget.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/payment/payment_page.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class ReserveLodgingPage extends StatefulWidget {
  final int idLodging;
  final String lodgingName;
  final String lodgingLocation;
  final int price;
  final String lodgingImage;
  const ReserveLodgingPage({
    super.key,
    required this.idLodging,
    required this.lodgingName,
    required this.lodgingLocation,
    required this.price,
    required this.lodgingImage,
  });

  @override
  State<ReserveLodgingPage> createState() => _ReserveLodgingPageState();
}

class _ReserveLodgingPageState extends State<ReserveLodgingPage> {
  final _peopleStayController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  int? _priceLodging;
  DateTime? _checkIn;
  DateTime? _checkOut;
  int? _durationStay;

  @override
  void initState() {
    super.initState();
    setState(() {
      _priceLodging = widget.price;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _peopleStayController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _confirmEmailController.dispose();
    _phoneNumberController.dispose();
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
          'Reservation Form',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.lodgingImage,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 192,
                        child: Text(
                          widget.lodgingName,
                          style: semiBoldTextStyle.copyWith(
                            color: darkBlueColor,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Rp ${_priceLodging.toString()} / night",
                        style: mediumTextStyle.copyWith(
                          color: blueColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomDatePickerWidget(
                      labelText: "Check In - Check Out",
                      hintText: _checkIn != null
                          ? "${DateFormat('dd/MMMM/y').format(_checkIn!)} - ${DateFormat('dd/MMMM/y').format(_checkOut!)}"
                          : "dd/mm/yy - dd/mm/yy",
                      labelTextStyle: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                      ),
                      style: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                        fontSize: 14,
                      ),
                      hintStyle: mediumTextStyle.copyWith(color: darkBlueColor),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDateRangePicker(
                        context: context,
                        fieldStartLabelText: "Check-in",
                        fieldEndLabelText: "Check-out",
                        helpText: "Select date range staying",
                        initialDateRange: DateTimeRange(
                          start: DateTime.now(),
                          end: DateTime.now().add(const Duration(days: 1)),
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                      ).then(
                        (value) {
                          if (value != null) {
                            setState(() {
                              _checkIn = value.start;
                              _checkOut = value.end;
                              _durationStay = value.duration.inDays;
                              _priceLodging = _priceLodging! * _durationStay!;
                            });
                          }
                        },
                      );
                    },
                    icon: Icon(
                      Icons.calendar_month_rounded,
                      size: 34,
                      color: darkBlueColor,
                    ),
                    padding: const EdgeInsets.all(0),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _peopleStayController,
                labelText: "How many people stay",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomTextFieldWidget(
                      controller: _firstNameController,
                      labelText: "First Name",
                      labelTextStyle: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                      ),
                      style: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                      ),
                      hintStyle: regularTextStyle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFieldWidget(
                      controller: _lastNameController,
                      labelText: "Last Name",
                      labelTextStyle: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                      ),
                      style: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                      ),
                      hintStyle: regularTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _emailController,
                labelText: "Email",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _confirmEmailController,
                labelText: "Confirm Email Adress",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _phoneNumberController,
                labelText: "Phone Number",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
                keyboardType: TextInputType.number,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _durationStay != null
          ? ClipRRect(
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
                          "Total:",
                          style: mediumTextStyle.copyWith(
                            color: whiteColor,
                          ),
                        ),
                        Text(
                          'Rp ${_priceLodging.toString()}',
                          style: boldTextStyle.copyWith(
                            color: whiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    CustomFilledButtonWidget(
                      buttonTitle: "Continue",
                      width: 130,
                      buttonTitleFontSize: 16,
                      buttonTitleFontWeight: FontWeight.w600,
                      onPressed: () {
                        if (_durationStay != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PaymentPage(
                                  dataBooking: {
                                    "id_booking": 2,
                                    "check_in": _checkIn.toString(),
                                    "check_out": _checkOut.toString(),
                                    "duration":
                                        "${_durationStay.toString()} day",
                                    "payment_method": "",
                                    "total_pay": _priceLodging,
                                    "id_lodging": widget.idLodging,
                                    "lodging_name": widget.lodgingName,
                                    "lodging_location": widget.lodgingLocation,
                                    "id_user": 1,
                                    "username": "Dino",
                                    "first_name": _firstNameController.text,
                                    "last_name": _lastNameController.text,
                                    "email": _emailController.text,
                                    "no_phone": _phoneNumberController.text,
                                    "count_people_stay":
                                        int.parse(_peopleStayController.text),
                                    "status_booking": 1,
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
