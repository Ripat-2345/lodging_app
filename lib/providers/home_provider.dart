import 'dart:collection';

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List _popularLodgings = [
    ["Terra Cottages Bali", "assets/images/lodging1.png"],
    ["ONAYA Bali Resort", "assets/images/lodging2.png"],
    ["Uluwatu Breeze Village", "assets/images/lodging3.png"],
    ["Terra Cottages Bali", "assets/images/lodging1.png"],
    ["ONAYA Bali Resort", "assets/images/lodging2.png"],
  ];

  List get popularLodgings => UnmodifiableListView(_popularLodgings);
}
