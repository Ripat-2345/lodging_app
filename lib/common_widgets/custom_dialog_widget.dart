import 'package:flutter/material.dart';
import 'package:lodging_app/pages/bottom_menu_bar_page.dart';
import 'package:lodging_app/theme.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Confirmation",
            style: TextStyle(
              color: darkBlueColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Confirm payment for this reservation?",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),
          buildDetailRow("Pemesan:", "Renji Yomo"),
          buildDetailRow("Email:", "Yomo@gmail.com"),
          buildDetailRow("No Hp:", "081262809999"),
          buildDetailRow("Check in:", "10 Maret 2024"),
          buildDetailRow("Check Out:", "11 Maret 2024"),
          buildDetailRow("Durasi:", "1 Malam"),
          buildDetailRow("Harga:", "1,500,000.-"),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomMenuBarPage()),
                    (route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "Your reservation completed, thank you!",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: yellowColor,
                      behavior: SnackBarBehavior.floating,
                      shape: const StadiumBorder(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      yellowColor), // Background color of button
                  foregroundColor: WidgetStateProperty.all(
                      darkBlueColor), // Text color of button text
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                ),
                child: const Text(
                  "Pay",
                  style: TextStyle(
                      fontSize:
                          18), // Optional: Define additional text styles here
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
