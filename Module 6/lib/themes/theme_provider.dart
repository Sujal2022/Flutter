import 'package:flutter/material.dart';
import 'package:module_6_assignment/themes/light_mode.dart';

import 'dart_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData; // Renamed getter to avoid conflict

  bool get isDarkMode => _themeData == dartMode;

  set themeData(ThemeData themeData)
  {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme()
  {
    if(_themeData == lightMode)
      {
        themeData = dartMode;
      }
    else
      {
        themeData = lightMode;
      }
  }
}
