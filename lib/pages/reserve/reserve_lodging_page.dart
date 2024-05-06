import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_date_picker_widget.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/reserve/widgets/check_box_is_travel_widget.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class ReserveLodgingPage extends StatelessWidget {
  const ReserveLodgingPage({super.key});

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
                      "assets/images/lodging6.png",
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
                          "Amnaya Resort Nusa Dua",
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
                        "Rp 1,500,000.- / 1 night",
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomDatePickerWidget(
                      labelText: "Check In",
                      hintText: "mm/dd/yy",
                      labelTextStyle:
                          mediumTextStyle.copyWith(color: darkBlueColor),
                      style: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                        fontSize: 14,
                      ),
                      hintStyle: regularTextStyle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomDatePickerWidget(
                      labelText: "Check Out",
                      hintText: "mm/dd/yy",
                      labelTextStyle:
                          mediumTextStyle.copyWith(color: darkBlueColor),
                      style: mediumTextStyle.copyWith(
                        color: darkBlueColor,
                        fontSize: 14,
                      ),
                      hintStyle: regularTextStyle,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const CheckBoxIsTravelWidget(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomTextFieldWidget(
                      labelText: "First Name",
                      labelTextStyle:
                          mediumTextStyle.copyWith(color: darkBlueColor),
                      style: mediumTextStyle.copyWith(color: darkBlueColor),
                      hintStyle: regularTextStyle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFieldWidget(
                      labelText: "Last Name",
                      labelTextStyle:
                          mediumTextStyle.copyWith(color: darkBlueColor),
                      style: mediumTextStyle.copyWith(color: darkBlueColor),
                      hintStyle: regularTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: "Email",
                labelTextStyle: mediumTextStyle.copyWith(color: darkBlueColor),
                style: mediumTextStyle.copyWith(color: darkBlueColor),
                hintStyle: regularTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: "Confirm Email Adress",
                labelTextStyle: mediumTextStyle.copyWith(color: darkBlueColor),
                style: mediumTextStyle.copyWith(color: darkBlueColor),
                hintStyle: regularTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: "Phone Number",
                labelTextStyle: mediumTextStyle.copyWith(color: darkBlueColor),
                style: mediumTextStyle.copyWith(color: darkBlueColor),
                hintStyle: regularTextStyle,
              )
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
                    "Total:",
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
                buttonTitle: "Pay Now",
                width: 120,
                buttonTitleFontSize: 16,
                buttonTitleFontWeight: FontWeight.w600,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
