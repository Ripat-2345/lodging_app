import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lodging_app/models/lodging_model.dart';

class LodgingProvider extends ChangeNotifier {
  List _searchLodgingMatch = [];

  final List _listLodgings = LodgingModel.data;

  List get listLodgings => UnmodifiableListView(_listLodgings);
  List get searchLodgingMatch => _searchLodgingMatch;

  void searchLodging(String keyword) {
    List newSearchLodgingMatch = _listLodgings
        .where(
          (element) => element['lodging_name'].toLowerCase().contains(keyword),
        )
        .toList();
    _searchLodgingMatch = newSearchLodgingMatch;
    notifyListeners();
  }
}
