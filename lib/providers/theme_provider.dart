import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _themeApp = true;

  bool get themeApp => _themeApp;

  set themeApp(bool newThemeApp) {
    _themeApp = newThemeApp;
    notifyListeners();
  }
}
