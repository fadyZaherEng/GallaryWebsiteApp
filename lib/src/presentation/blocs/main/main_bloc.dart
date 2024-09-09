import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_website_app/src/domain/usecase/get_language_use_case.dart';
import 'package:gallary_website_app/src/domain/usecase/set_language_use_case.dart';
import 'package:gallary_website_app/src/presentation/blocs/main/main_state.dart';

class MainCubit extends Cubit<MainState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;
  ThemeMode themeMode = ThemeMode.light;

  MainCubit(
    this._getLanguageUseCase,
    this._setLanguageUseCase,
  ) : super(MainInitial()) {
    getLanguage();
  }

  void getLanguage() async {
    final language = _getLanguageUseCase();
    await _setLanguageUseCase(language);
    emit(MainChangeLangAndTheme(lang: language, theme: themeMode));
  }

  void toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    final language = _getLanguageUseCase();
    await _setLanguageUseCase(language);
    emit(MainChangeLangAndTheme(lang: language, theme: themeMode));
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
}
