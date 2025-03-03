import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF022270); // Purple
  static const Color secondaryColor = Color(0xFFD5D6EA); // Teal
  static const Color backgroundColor = Color(0xFFFFFFFF); // White
  static const Color textColor = Color(0xFF070606); // Black
  // static const Color container = Color(value);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0x0ff9f9f9),
      Color(0xFFD5D6EA),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient primarygradint = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFFFF), Color(0xFFE6E6FA), Color(0xFF6A5ACD)],
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [
      Color(0xFFF9F9F9), // Deep Orange
      Color(0xFF6569B3), // Amber
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
