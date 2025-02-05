import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/screen_utils.dart';
import 'home.dart'; // Import HomePage

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // Close the keyboard before navigation
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      // Navigate to Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(title: 'Bio Track'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Close the keyboard when the screen is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  void dispose() {
    // Close the keyboard when the screen is disposed
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth(context);
    final screenHeight = ScreenUtils.getScreenHeight(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundColor,
              AppColors.white
            ], // Use constants
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1, // 10% of screen width
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  width: AppSizes.logoWidth, // Use constant
                ),
                const SizedBox(height: AppSizes.fieldSpacing), // Use constant

                // Welcome Text
                const Text(
                  "Welcome to BioTrack",
                  style: AppTextStyles.welcomeStyle, // Use constant
                ),
                const SizedBox(
                    height: AppSizes.formVerticalPadding), // Use constant

                // Login Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Username Field
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                AppSizes.borderRadius), // Rounded corners
                            borderSide: const BorderSide(
                                color: AppColors.white), // Custom border color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor,
                                width: 1.5), // Default border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 2), // Focused border
                          ),
                          prefixIcon: const Icon(Icons.person,
                              color: AppColors.primaryColor),
                          contentPadding: EdgeInsets.symmetric(
                            vertical:
                                screenHeight * 0.02, // 2% of screen height
                            horizontal: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          if (value.length < 4) {
                            return 'Username must be at least 4 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                          height: AppSizes.fieldSpacing), // Use constant

                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 237, 246, 229)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 205, 220, 193),
                                width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 228, 239, 218),
                                width: 2),
                          ),
                          prefixIcon: const Icon(Icons.lock,
                              color: AppColors.primaryColor),
                          contentPadding: EdgeInsets.symmetric(
                            vertical:
                                screenHeight * 0.02, // 2% of screen height
                            horizontal: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                          height: AppSizes.formVerticalPadding), // Use constant

                      // Login Button
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical:
                                AppSizes.buttonVerticalPadding, // Use constant
                            horizontal: AppSizes
                                .buttonHorizontalPadding, // Use constant
                          ),
                          backgroundColor:
                              AppColors.primaryColor, // Use constant
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppSizes.borderRadius), // Use constant
                          ),
                        ),
                        child: const Text(
                          "LOGIN",
                          style: AppTextStyles.buttonTextStyle, // Use constant
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
