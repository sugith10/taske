import 'package:flutter/material.dart';
import 'package:todo/core/theme/color/app_color.dart';

class AppTheme {
  ThemeData themeData = ThemeData(
    fontFamily: "Gilroy",
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.button),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.bg,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.button,
        // foregroundColor: _color.buttonForground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        animationDuration: const Duration(milliseconds: 200),
      ),
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
  );
}
