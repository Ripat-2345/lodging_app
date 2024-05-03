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

  final List _mostVisitedPlace = [
    [
      "assets/images/lodging4.png",
      "S Resorts Hidden Valley Bali",
      ["3 bedrooms", "2 bathrooms", "1 pools"],
      "Rp 1,500,000.- ",
    ],
    [
      "assets/images/lodging5.png",
      "Harsono Boutique Resort Bali",
      ["6 bedrooms", "3 bathrooms", "1 pools"],
      "Rp 3,500,000.- ",
    ],
    [
      "assets/images/lodging6.png",
      "Bali Jungle Camping by Amerta",
      ["1 bedrooms", "1 bathrooms"],
      "Rp 1,000,000.- ",
    ],
  ];

  List get popularLodgings => UnmodifiableListView(_popularLodgings);
  List get mostVisitedPlace => UnmodifiableListView(_mostVisitedPlace);
}
