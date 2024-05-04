import 'package:flutter/material.dart';

class LodgingProvider extends ChangeNotifier {
  final List _listLodgings = [
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
      "Bali Jungle Camping by Amerta  Camping by Amerta",
      ["1 bedrooms", "1 bathrooms"],
      "Rp 1,000,000.- ",
    ],
  ];

  List _searchLodgingMatch = [];

  List get listLodgings => _listLodgings;

  List get searchLodgingMatch => _searchLodgingMatch;

  void searchLodging(String keyword) {
    List newSearchLodgingMatch = _listLodgings
        .where((element) => element[1].toLowerCase().contains(keyword))
        .toList();
    _searchLodgingMatch = newSearchLodgingMatch;
    notifyListeners();
  }
}
