import 'package:flutter/material.dart';
import 'package:lodging_app/common_widgets/custom_filled_button_widget.dart';
import 'package:lodging_app/pages/payment/payment_transfer_page.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  String _paymentMethod = "";
  final _nominalController = TextEditingController();
  int? _selectedNominal;

  final List<int> _nominalOptions = [
    50000,
    100000,
    200000,
    500000,
    1000000,
    2000000
  ];

  void _validateMsgFormTopUp(String msg) {
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
  void dispose() {
    super.dispose();
    _nominalController.dispose();
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
          'Top Up',
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
              TextField(
                controller: _nominalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    "Nominal Top Up",
                    style: mediumTextStyle.copyWith(
                      color: darkBlueColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefix: Text("Rp ", style: mediumTextStyle),
                ),
              ),
              const SizedBox(height: 20),
              DropdownMenu(
                width: MediaQuery.of(context).size.width / 1.27,
                label: Text(
                  "Pay With",
                  style: mediumTextStyle.copyWith(
                    color: darkBlueColor,
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: darkBlueColor),
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
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _nominalOptions.map((nominal) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedNominal = nominal;
                        _nominalController.text = nominal.toString();
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 15) / 4,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: darkBlueColor,
                        ),
                        color: _selectedNominal == nominal
                            ? darkBlueColor
                            : whiteColor,
                      ),
                      child: Text(
                        'Rp $nominal',
                        style: mediumTextStyle.copyWith(
                          color: _selectedNominal == nominal
                              ? whiteColor
                              : darkBlueColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: CustomFilledButtonWidget(
                  width: 100,
                  buttonTitle: "Pay",
                  onPressed: () {
                    if (_nominalController.text.isNotEmpty) {
                      if (int.tryParse(_nominalController.text) != null) {
                        if (_paymentMethod.isNotEmpty) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentTransferPage(
                                paymentMethod: _paymentMethod,
                              ),
                            ),
                          );
                        } else {
                          _validateMsgFormTopUp("Pilih metode bayar!");
                        }
                      } else {
                        _validateMsgFormTopUp("Nominal hanya angka!");
                      }
                    } else {
                      _validateMsgFormTopUp("Nominal harus di isi!");
                    }
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
