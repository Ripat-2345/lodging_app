import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lodging_app/models/lodging_model.dart';

class LodgingProvider extends ChangeNotifier {
  bool _isFilteredLodging = false;
  List _searchLodgingMatch = [];
  final List _listLodgings = LodgingModel.data;

  bool get isFilteredLodging => _isFilteredLodging;
  List get searchLodgingMatch => _searchLodgingMatch;
  List get listLodgings => UnmodifiableListView(_listLodgings);

  set isFilteredLodging(val) {
    _isFilteredLodging = val;
    notifyListeners();
  }

  void searchLodging(String keyword) {
    List newSearchLodgingMatch = _listLodgings
        .where(
          (element) => element['lodging_name'].toLowerCase().contains(keyword),
        )
        .toList();
    _searchLodgingMatch = newSearchLodgingMatch;
    notifyListeners();
  }

  void setIsFavoriteLodging(val, String lodgingName) {
    var findLodging = _listLodgings.where(
      (element) => element['lodging_name'].contains(lodgingName),
    );
    if (findLodging.isNotEmpty) {
      var lodging = findLodging.first;
      lodging.update(
        "is_favorite",
        (value) => !val,
        ifAbsent: () => !val,
      );
    }
    notifyListeners();
  }
}
