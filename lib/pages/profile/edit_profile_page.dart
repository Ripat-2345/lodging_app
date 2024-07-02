import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
          'Edit Profile',
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
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/dino.PNG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: blueColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DinoWahyu",
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "DinoWahyu@gmail.com",
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: yellowColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_person_rounded,
                              color: darkBlueColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Edit Password",
                              style: mediumTextStyle.copyWith(
                                color: darkBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: "Username",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: "Address",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                labelText: "Phone",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: CustomFilledButtonWidget(
                  buttonTitle: "Save Changes",
                  width: 170,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
