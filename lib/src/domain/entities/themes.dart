import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      primarySwatch: Colors.deepPurple,
      backgroundColor: Colors.white,
      cardColor: Colors.grey[900]);

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      primaryColor: Colors.purple,
      backgroundColor: Colors.white,
      cardColor: Colors.white);
}