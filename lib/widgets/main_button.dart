import 'package:flutter/material.dart';
import 'package:sign_in_up/assets/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final String? iconPath;
  final Function() onTap;
  final double? width; // Allow customizing width
  final double? height; // Allow customizing height
  final double borderRadius; // Control the border radius

  const MainButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    required this.onTap,
    this.iconPath,
    this.width, // Optional width
    this.height = 50, // Default height
    this.borderRadius = 10.0, // Default radius
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? double.infinity, // Use provided width or default to infinity
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius), // Use provided border radius
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconPath == null
                  ? Container()
                  : Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image(
                  image: AssetImage(iconPath!),
                  height: 40,
                ),
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                  color: textColor ?? AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}