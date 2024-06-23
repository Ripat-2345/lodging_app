import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lodging_app/models/booking_model.dart';

class BookingProvider extends ChangeNotifier {
  final List _listBookings = BookingModel.data;

  List get listBookings => UnmodifiableListView(_listBookings);
}
