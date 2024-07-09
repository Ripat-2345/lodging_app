import 'package:flutter/material.dart';
import 'package:lodging_app/models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  final List _listNotification = NotificationModel.listNotification;

  List get listNotification => _listNotification;

  void addNotification(
    String datetime,
    String label,
    String title,
    String content,
  ) {
    Map notificationData = {
      "id": _listNotification.length + 1,
      "notification_date": datetime,
      "label": label,
      "title": title,
      "content": content,
    };
    NotificationModel.listNotification.add(notificationData);
    notifyListeners();
  }
}
