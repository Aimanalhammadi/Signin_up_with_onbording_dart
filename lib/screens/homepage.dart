import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الصفحة الرئيسية',
          style: GoogleFonts.cairo(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'مرحبًا بك في التطبيق!',
              style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'استمتع باستخدام التطبيق واستكشاف الميزات.',
              style: GoogleFonts.cairo(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Action for button
              },
              child: Text(
                'استكشاف المزيد',
                style: GoogleFonts.cairo(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action for button
              },
              child: Text(
                'تسجيل الخروج',
                style: GoogleFonts.cairo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}