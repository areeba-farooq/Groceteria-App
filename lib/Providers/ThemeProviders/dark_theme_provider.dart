import 'package:flutter/material.dart';
import 'package:groceteria_app/Services/ThemeService/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
//? Object of Dark Theme Prefs Class in order to save the theme changes to shared preferences
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  bool _darkTheme = false; //private
  bool get getDarkTheme => _darkTheme; //getting private var

  //***************SETTING DARK THEME METHOD***************//
  set setDarkTheme(bool value) {
    _darkTheme = value; //save this in the shared preferences
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
