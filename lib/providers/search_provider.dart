import 'dart:collection';

import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final List _listItemSearch = [
    "assets/images/lodging1.png",
    "assets/images/lodging2.png",
    "assets/images/lodging3.png",
    "assets/images/lodging4.png",
    "assets/images/lodging5.png",
    "assets/images/lodging6.png",
    "assets/images/lodging1.png",
    "assets/images/lodging2.png",
    "assets/images/lodging3.png",
    "assets/images/lodging4.png",
    "assets/images/lodging5.png",
    "assets/images/lodging6.png",
  ];

  List get listItemSearch => UnmodifiableListView(_listItemSearch);
}
