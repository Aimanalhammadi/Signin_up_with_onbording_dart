import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_up/assets/colors.dart';
import 'package:sign_in_up/widgets/main_button.dart';
import 'package:sign_in_up/widgets/custom_text_field.dart'; // Import the custom text field
import 'register_screen.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:sign_in_up/models/list_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  Future<void> login() async {
    final user = users.firstWhere(
      (user) =>
          user.email == emailController.text &&
          user.password == passwordController.text,
      orElse: () => User(userId: 0, name: '', email: '', password: ''),
    );

    if (user.userId != 0) {
      setState(() {
        _errorMessage = '';
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم تسجيل الدخول بنجاح'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
      });
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      login();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(gradient: AppColors.primarygradint),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      ClipOval(
                        child: Image.asset(
                          'images/logo2.jpg',
                          height: screenHeight * 0.15,
                          width: screenHeight * 0.15,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "تسجيل الدخول",
                        style: GoogleFonts.cairo(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.cairo(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: "لا تملك حساب؟ "),
                            TextSpan(
                              text: "إنشاء حساب",
                              style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextField(
                        hint: "البريد الإلكتروني",
                        icon: Icons.email,
                        controller: emailController,
                        validator: _validateEmail,
                      ),
                      CustomTextField(
                        hint: "كلمة المرور",
                        icon: Icons.lock,
                        controller: passwordController,
                        isPassword: true,
                        validator: _validatePassword,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 7),
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.cairo(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "نسيت كلمة السر؟",
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      MainButton(
                        text: 'تسجيل الدخول',
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.backgroundColor,
                        onTap: _submit,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 3,
                            color: AppColors.primaryColor.withOpacity(0.3),
                            width: screenWidth * 0.3,
                          ),
                          const Text(" أو "),
                          Container(
                            height: 3,
                            color: AppColors.primaryColor.withOpacity(0.3),
                            width: screenWidth * 0.3,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      MainButton(
                        text: 'التسجيل بإستخدام جوجل',
                        backgroundColor: AppColors.backgroundColor,
                        textColor: AppColors.textColor,
                        iconPath: '../images/goo.png',
                        onTap: () {},
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      MainButton(
                        text: 'التسجيل بإستخدام فيسبوك',
                        backgroundColor:
                            AppColors.backgroundColor.withOpacity(0.9),
                        textColor: AppColors.textColor,
                        iconPath: '../images/facebook_5968764.png',
                        onTap: () {},
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      if (_errorMessage.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _errorMessage,
                            style: GoogleFonts.cairo(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تحتوي على 6 خانات أو أكثر';
    }
    return null;
  }
}
