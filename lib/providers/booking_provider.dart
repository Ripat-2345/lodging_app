import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lodging_app/models/booking_model.dart';

class BookingProvider extends ChangeNotifier {
  var checkIn = TextEditingController();
  var checkOut = TextEditingController();
  var peopleStay = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var confirmEmail = TextEditingController();
  var phoneNumber = TextEditingController();

  final List _listBookings = BookingModel.data;
  int _statusBooking = 1;

  List get listBookings => UnmodifiableListView(_listBookings);
  int get statusBooking => _statusBooking;

  set statusBooking(int newStatus) {
    _statusBooking = newStatus;
    notifyListeners();
  }

  void resetFormBooking() {
    checkIn = TextEditingController();
    checkOut = TextEditingController();
    peopleStay = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    confirmEmail = TextEditingController();
    phoneNumber = TextEditingController();
    notifyListeners();
  }
}
