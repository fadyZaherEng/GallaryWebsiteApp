import 'package:flutter/material.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class MainChangeLangAndTheme extends MainState {
  final String lang;
  final ThemeMode theme;
  MainChangeLangAndTheme({required this.lang, required this.theme});
}