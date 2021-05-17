import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(appThemeData[AppTheme.light]!);

  void changeTheme(AppTheme appTheme) => emit(appThemeData[appTheme]!);
}
