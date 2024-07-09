import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lodging_app/models/booking_model.dart';

class BookingProvider extends ChangeNotifier {
  final List _listBookings = BookingModel.data;
  int _statusBooking = 1;

  List get listBookings => UnmodifiableListView(_listBookings);
  int get statusBooking => _statusBooking;

  set statusBooking(int newStatus) {
    _statusBooking = newStatus;
    notifyListeners();
  }

  void addBooking(Map newBookingModel) {
    BookingModel.data.add(newBookingModel);
    notifyListeners();
  }
}
