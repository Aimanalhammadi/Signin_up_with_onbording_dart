import 'package:flutter/material.dart';
import 'package:sign_in_up/assets/colors.dart';
import 'package:sign_in_up/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': '../images/High School-amico.png',
      'title': 'FindBest',
      'description': 'مرحبا بك في تطبيق ',
    },
    {
      'image': '../images/Address-amico.png',
      'title': 'بحث مخصص',
      'description': 'ابحث عن ما يناسب احتياجاتك',
    },
    {
      'image': '../images/Learning-amico.png',
      'title': 'توصيات مخصصة',
      'description': 'احصل على توصيات تناسب اهتماماتك',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: Container(
          decoration:
          const BoxDecoration(gradient: AppColors.secondaryGradient),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Display circular image only for the first page
                        if (index == 0)
                          ClipOval(
                            child: Image.asset(
                              'images/logo2.jpg', // Replace with your app icon path
                              height: 100, // Set the desired height
                              width: 100, // Set the desired width
                              fit: BoxFit.cover,
                            ),
                          )
                        else
                          Image.asset(
                            _pages[index]['image']!,
                            height: 300,
                          ),
                        const SizedBox(height: 30),
                        Text(
                          _pages[index]['title']!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _pages[index]['description']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        _pages.length,
                            (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppColors.primaryColor
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          // Navigate to the login screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                        AppColors.primaryColor,
                      ),
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? 'إبداء الان'
                            : 'التالي',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}