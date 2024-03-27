import 'package:flutter/material.dart';

class CustomIconTheme {
  // * Making the constructor private
  CustomIconTheme._();
  static Color? lightIconColor = Colors.grey.shade900;
  static Color? darkIconColor = Colors.grey.shade100;

  // Light Icon color
  static IconThemeData lightIconTheme = IconThemeData(
    color: lightIconColor,
    size: 38.0,
  );

  // Light Icon color
  static IconThemeData darkIconTheme = IconThemeData(
    color: darkIconColor,
    size: 38.0,
  );
}
