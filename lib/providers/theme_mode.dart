import 'package:flutter/material.dart';

class ThemeModeNotifier with ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.light;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void changeThemeMode() {
    _currentThemeMode = (_currentThemeMode == ThemeMode.light)
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
