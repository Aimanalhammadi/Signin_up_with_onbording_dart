import 'package:flutter/material.dart';

import 'screens/inboarding.dart';
// import 'assets/login_screen.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Example',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const OnboardingScreen(),
    );
  }
}