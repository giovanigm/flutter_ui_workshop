import 'package:flutter/material.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData.from(
    colorScheme: const ColorScheme.light(),
  ).copyWith(
    inputDecorationTheme: _inputDecorationTheme,
  ),
  AppTheme.dark: ThemeData.from(
    colorScheme: const ColorScheme.dark(),
  ).copyWith(
    inputDecorationTheme: _inputDecorationTheme,
  ),
};

const _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(),
);
