import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class CheckBoxGenderWidget extends StatefulWidget {
  const CheckBoxGenderWidget({super.key});

  @override
  State<CheckBoxGenderWidget> createState() => _CheckBoxGenderWidgetState();
}

class _CheckBoxGenderWidgetState extends State<CheckBoxGenderWidget> {
  bool? isMaleChecked = false;
  bool? isFemaleChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: mediumTextStyle.copyWith(color: blueColor),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: Checkbox(
                      activeColor: yellowColor,
                      checkColor: yellowColor,
                      side: BorderSide(color: blueColor, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(color: blueColor, width: 2),
                      ),
                      value: isMaleChecked,
                      onChanged: (bool? value) {
                        if (isFemaleChecked == true) {
                          setState(() {
                            isFemaleChecked = false;
                          });
                        }
                        setState(() {
                          isMaleChecked = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Male",
                    style: mediumTextStyle.copyWith(
                      color: blueColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: Checkbox(
                      activeColor: yellowColor,
                      checkColor: yellowColor,
                      side: BorderSide(color: blueColor, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(color: blueColor, width: 2),
                      ),
                      value: isFemaleChecked,
                      onChanged: (bool? value) {
                        if (isMaleChecked == true) {
                          setState(() {
                            isMaleChecked = false;
                          });
                        }
                        setState(() {
                          isFemaleChecked = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Female",
                    style: mediumTextStyle.copyWith(
                      color: blueColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
