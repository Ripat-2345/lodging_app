import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lodging_app/pages/notification/notification_detail_page.dart';
import 'package:lodging_app/providers/notification_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var notificationProvider = Provider.of<NotificationProvider>(context);
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
          'My Notifications',
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
        ),
        child: SingleChildScrollView(
          child: Column(
            children: notificationProvider.listNotification.reversed.map(
              (data) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NotificationDetailPage(
                            detailNotification: data,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 24,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: data['label'] == "Transaction"
                                ? blueColor
                                : yellowColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data['label'],
                                style: mediumTextStyle.copyWith(
                                  color: data['label'] == "Transaction"
                                      ? whiteColor
                                      : darkBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['title'],
                          style: semiBoldTextStyle.copyWith(
                            color: darkBlueColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          data['content'],
                          style: regularTextStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          DateFormat("d MMM y").format(
                            DateTime.parse(
                              data['notification_date'],
                            ),
                          ),
                          style: regularTextStyle.copyWith(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
