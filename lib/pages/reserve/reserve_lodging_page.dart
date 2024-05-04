import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/reserve/widgets/check_box_is_travel_widget.dart';
import 'package:lodging_app/theme.dart';

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
            color: darkBlueColor,
          ),
        ),
        title: Text(
          'Reservation Form',
          style: semiBoldTextStyle.copyWith(
            color: darkBlueColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 22, top: 10, right: 22),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: 210,
                        height: 40,
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
                      const SizedBox(height: 10),
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
                    child: CustomTextFieldWidget(
                      labelText: "Check In",
                      labelTextStyle:
                          mediumTextStyle.copyWith(color: darkBlueColor),
                      style: mediumTextStyle.copyWith(color: darkBlueColor),
                      hintStyle: regularTextStyle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFieldWidget(
                      labelText: "Check Out",
                      labelTextStyle:
                          mediumTextStyle.copyWith(color: darkBlueColor),
                      style: mediumTextStyle.copyWith(color: darkBlueColor),
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
          color: darkBlueColor,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rp 1,500,000.-",
                    style: boldTextStyle.copyWith(
                      color: whiteColor,
                      fontSize: 20,
                    ),
                  )
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
