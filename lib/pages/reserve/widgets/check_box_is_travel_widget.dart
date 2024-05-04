import 'package:flutter/material.dart';
import 'package:lodging_app/theme.dart';

class CheckBoxIsTravelWidget extends StatefulWidget {
  const CheckBoxIsTravelWidget({super.key});

  @override
  State<CheckBoxIsTravelWidget> createState() => _CheckBoxIsTravelWidgetState();
}

class _CheckBoxIsTravelWidgetState extends State<CheckBoxIsTravelWidget> {
  bool? isYesChecked = false;
  bool? isNoChecked = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Are you travelling for work?",
          style: mediumTextStyle.copyWith(color: darkBlueColor),
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
                      value: isYesChecked,
                      onChanged: (bool? value) {
                        if (isNoChecked == true) {
                          setState(() {
                            isNoChecked = false;
                          });
                        }
                        setState(() {
                          isYesChecked = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Yes",
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
                      value: isNoChecked,
                      onChanged: (bool? value) {
                        if (isYesChecked == true) {
                          setState(() {
                            isYesChecked = false;
                          });
                        }
                        setState(() {
                          isNoChecked = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "No",
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
