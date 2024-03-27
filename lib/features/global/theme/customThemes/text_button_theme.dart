import 'package:flutter/material.dart';

class CustomTextButtonTheme {
  // * Making the constructor private
  CustomTextButtonTheme._();

  // Light text theme
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.grey.shade500,
    ),
  );

  // Dark text theme
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.grey.shade700,
    ),
  );
}
