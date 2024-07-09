import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/common_widgets/custom_textfield_widget.dart';
import 'package:lodging_app/pages/profile/edit_password_page.dart';
import 'package:lodging_app/providers/auth_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  XFile? _tempFileImg;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        var authProvider = Provider.of<AuthProvider>(context, listen: false);
        setState(() {
          _usernameController.text = authProvider.userAuth['username'];
          _addressController.text = authProvider.userAuth['address'];
          _phoneController.text = authProvider.userAuth['no_phone'];
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: darkBlueColor),
                        ),
                        child: _tempFileImg == null
                            ? authProvider.userAuth['user_pict'].isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      File(authProvider.userAuth['user_pict']),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Center(
                                    child: ImageIcon(
                                      const AssetImage(
                                          "assets/icons/profile_icon.png"),
                                      color: darkBlueColor,
                                    ),
                                  )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  File(_tempFileImg!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (image != null) {
                              setState(() {
                                _tempFileImg = image;
                              });
                            }
                          },
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
                        authProvider.userAuth['username'],
                        style: semiBoldTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        authProvider.userAuth['email'],
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditPasswordPage(),
                            ),
                          );
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                controller: _usernameController,
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
                controller: _addressController,
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
                controller: _phoneController,
                labelText: "Phone",
                labelTextStyle: mediumTextStyle.copyWith(
                  color: blueColor,
                ),
                style: mediumTextStyle.copyWith(
                  color: darkBlueColor,
                ),
                hintStyle: regularTextStyle,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: CustomFilledButtonWidget(
                  buttonTitle: "Save Changes",
                  width: 170,
                  onPressed: () {
                    authProvider.editUser(
                      _tempFileImg != null
                          ? _tempFileImg!.path
                          : authProvider.userAuth['user_pict'],
                      _usernameController.text,
                      _addressController.text,
                      _phoneController.text,
                      authProvider.userAuth['email'],
                      authProvider.userAuth['password'],
                    );
                    Navigator.pop(context);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Profil Berhasil Diubah !',
                          style: mediumTextStyle.copyWith(color: darkBlueColor),
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: yellowColor,
                        behavior: SnackBarBehavior.floating,
                        shape: const StadiumBorder(),
                      ));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
