import 'package:flutter/material.dart';

class CustomBottomNavBarTheme {
  CustomBottomNavBarTheme._();

  // Light bottom nav bar theme
  static BottomNavigationBarThemeData lightBottomNavBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade400,
    selectedItemColor: Colors.green.shade500,
    unselectedItemColor: Colors.grey.shade600,
  );
  // Dark bottom nav bar theme
  static BottomNavigationBarThemeData darkBottomNavBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade900,
    selectedItemColor: Colors.green.shade700,
    unselectedItemColor: Colors.grey.shade700,
  );
}
