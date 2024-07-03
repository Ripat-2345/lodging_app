import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final List _listTopikHelpCenter = [
    [Icons.person, "Tentang akun saya"],
    [Icons.hotel, "Reservasi"],
    [Icons.wallet, "Pembayaran"],
  ];

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
          'Help Center',
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
                "Ada yang bisa kami bantu?",
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 20,
                ),
              ),
              Text(
                "Silahkan pilih topik",
                style: mediumTextStyle.copyWith(
                  color: blueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                children: _listTopikHelpCenter.map(
                  (data) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        color: whiteColor,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                data[0],
                                size: 34,
                                color: darkBlueColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                data[1],
                                style: mediumTextStyle.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 30),
              Text(
                "Apabila kendala anda tidak tersedia di atas, silahkan hubungi help center!",
                style: mediumTextStyle.copyWith(
                  color: blueColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              CustomFilledButtonWidget(
                width: 120,
                height: 40,
                buttonTitle: "Hubungi",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
