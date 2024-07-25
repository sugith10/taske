import 'package:flutter/material.dart';
import 'package:taske/core/theme/color/app_color.dart';

class AppTheme {
  ThemeData themeData = ThemeData(
      fontFamily: "Gilroy",
      primaryColor: AppColor.primary,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.bg,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.bg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          animationDuration: const Duration(milliseconds: 200),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.bg,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryText),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.danger),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.transparent,
        shape: CircleBorder(),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: AppColor.create, color: AppColor.bg),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColor.bg,
      ));
}
