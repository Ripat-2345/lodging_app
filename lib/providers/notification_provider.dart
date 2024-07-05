import 'package:flutter/material.dart';
import 'package:lodging_app/models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  final List _listNotification = NotificationModel.listNotification;

  List get listNotification => _listNotification;
}
