import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        accentColor: isDarkTheme ? Colors.white : Colors.black,
        backgroundColor: isDarkTheme ? Color(0xFF000000) : Color(0xFFE5E5E5),
        accentIconTheme: isDarkTheme
            ? IconThemeData(color: Colors.black)
            : IconThemeData(color: Colors.white),
        dividerColor: isDarkTheme ? Colors.black54 : Colors.white54,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light);
  }
}
