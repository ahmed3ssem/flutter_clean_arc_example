import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';
import 'package:flutter_clean_arc_example/core/utils/app_strings.dart';

ThemeData appTheme(){
  return ThemeData(
    // main color in app
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    fontFamily: AppStrings.fontName,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 16,
        color: AppColors.primary,
        fontWeight: FontWeight.w500
      )
    )
  );
}