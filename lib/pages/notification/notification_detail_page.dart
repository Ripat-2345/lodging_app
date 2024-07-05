import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class NotificationDetailPage extends StatelessWidget {
  final Map detailNotification;
  const NotificationDetailPage({super.key, required this.detailNotification});

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
          'Transaction',
          style: semiBoldTextStyle.copyWith(
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 22,
          top: 10,
          right: 22,
          bottom: 10,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: detailNotification['label'] == "Transaction"
                          ? blueColor
                          : yellowColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          detailNotification['label'],
                          style: mediumTextStyle.copyWith(
                            color: detailNotification['label'] == "Transaction"
                                ? whiteColor
                                : darkBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateFormat("d MMM y").format(
                      DateTime.parse(
                        detailNotification['notification_date'],
                      ),
                    ),
                    style: regularTextStyle.copyWith(
                      color: darkBlueColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              Text(
                detailNotification['title'],
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 16,
                ),
              ),
              Text(
                detailNotification['content'],
                style: regularTextStyle,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
