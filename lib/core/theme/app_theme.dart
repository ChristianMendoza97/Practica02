import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/theme/app_color_pallete.dart';

class AppTheme {
  static _border([Color color = AppColorPallete.borderColor])=>
  OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 3,
    ),
    borderRadius: BorderRadius.circular(10),
  ); 

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColorPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppColorPallete.gradient1),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorPallete.backgroundColor,
    )
  );
}
