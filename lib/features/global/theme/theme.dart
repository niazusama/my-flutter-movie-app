import 'package:flutter/material.dart';
import 'package:movie_app_ver2/features/global/theme/customThemes/bottom_nav_bar_theme.dart';
import 'package:movie_app_ver2/features/global/theme/customThemes/icon_theme.dart';
import 'package:movie_app_ver2/features/global/theme/customThemes/text_button_theme.dart';
import 'package:movie_app_ver2/features/global/theme/customThemes/text_theme.dart';

class CustomThemeData {
  // * Making the constructor private
  CustomThemeData._();

  // Light theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.grey.shade400,
      // When toggle button is on
      focusColor: Colors.green.shade500,
      // When toggle button is off
      disabledColor: Colors.grey.shade500,
      // Indicator color
      indicatorColor: Colors.green.shade500,
      scaffoldBackgroundColor: Colors.white,
      // For light color the text would be in dark color
      textTheme: CustomTextTheme.lightTextTheme,
      // Text button
      textButtonTheme: CustomTextButtonTheme.lightTextButtonTheme,
      // Bottom navigation bar
      bottomNavigationBarTheme: CustomBottomNavBarTheme.lightBottomNavBarTheme,
      // Icons theme
      iconTheme: CustomIconTheme.lightIconTheme);

  // Dark theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.grey.shade900,
      // When toggle button is on
      focusColor: Colors.green.shade700,
      // When toggle button is off
      disabledColor: Colors.grey.shade700,
      // Indicator color
      indicatorColor: Colors.green.shade700,
      scaffoldBackgroundColor: Colors.black,
      // For dark color the text would be in light color
      textTheme: CustomTextTheme.darkTextTheme,
      // Text button
      textButtonTheme: CustomTextButtonTheme.lightTextButtonTheme,
      // Bottom navigation bar
      bottomNavigationBarTheme: CustomBottomNavBarTheme.darkBottomNavBarTheme,
      // Icons theme
      iconTheme: CustomIconTheme.darkIconTheme);
}
