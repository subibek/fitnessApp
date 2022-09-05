import 'package:flutter/material.dart';

import '../login/loginPage.dart';



class ThemeProvider extends ChangeNotifier{

  Future setColor(bool isDark) async {
    preferences!.setBool("theme", isDark);
  }

  static ThemeMode? themeMode;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    setColor(isOn);
  }
}

class MyThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    colorScheme: ColorScheme.dark(),
    primaryColor: Colors.black54,
    fontFamily: 'Lobster'
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.white,
      fontFamily: 'Lobster'
  );
}