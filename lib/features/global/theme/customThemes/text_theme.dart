import 'package:flutter/material.dart';

class CustomTextTheme {
  // * Making the constructor private
  CustomTextTheme._();
  // Colors constants
  static Color? lightTextColor = Colors.grey.shade900;
  static Color? darkTextColor = Colors.grey.shade100;
  static Color? lightDescripColor = Colors.grey.shade700;
  static Color? darkDescripColor = Colors.grey.shade500;

  // * Light theme
  static TextTheme lightTextTheme = TextTheme(
      // Font size 52
      displayMedium: const TextStyle().copyWith(
        color: lightTextColor,
        fontWeight: FontWeight.bold,
      ),
      // Font size 36
      displaySmall: const TextStyle().copyWith(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      // Font size 32
      headlineLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      // Font size 28
      headlineMedium: const TextStyle().copyWith(
        color: lightTextColor,
        fontWeight: FontWeight.bold,
      ),
      // Font size 16
      titleMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      bodyLarge: const TextStyle().copyWith(
        color: lightDescripColor,
        fontSize: 20.0,
      ),
      bodyMedium: const TextStyle().copyWith(
        fontSize: 18.0,
        color: lightTextColor,
      ),
      // Font size 12
      bodySmall: const TextStyle().copyWith(
        color: lightDescripColor,
      ));

  // * Dark theme
  static TextTheme darkTextTheme = TextTheme(
      // Font size 52
      displayMedium: const TextStyle().copyWith(
        color: darkTextColor,
        fontWeight: FontWeight.bold,
      ),
      // Font size 36
      displaySmall: const TextStyle().copyWith(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      // Font size 32
      headlineLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      // Font size 28
      headlineMedium: const TextStyle().copyWith(
        color: darkTextColor,
        fontWeight: FontWeight.bold,
      ),
      // Font size 16
      titleMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      bodyLarge: const TextStyle().copyWith(
        color: darkDescripColor,
        fontSize: 20.0,
      ),
      bodyMedium: const TextStyle().copyWith(
        fontSize: 18.0,
        color: darkTextColor,
      ),
      // Font size 12
      bodySmall: const TextStyle().copyWith(
        color: darkDescripColor,
      ));
}
