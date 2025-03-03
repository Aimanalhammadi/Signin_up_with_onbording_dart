import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextThemeWidget extends StatelessWidget {
  final Widget child;

  const CustomTextThemeWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.cairo(), // Default font for large body text
          bodyMedium: GoogleFonts.cairo(), // Default font for medium body text
          bodySmall: GoogleFonts.cairo(), // Default font for small body text
          displayLarge: GoogleFonts.cairo(
              fontSize: 24, fontWeight: FontWeight.bold), // Headline
          displayMedium: GoogleFonts.cairo(
              fontSize: 20, fontWeight: FontWeight.bold), // Sub-headline
          labelLarge: GoogleFonts.cairo(fontSize: 16), // Button text
        ),
      ),
      home: child,
    );
  }
}
