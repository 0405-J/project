import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants.dart';
import '../utils/screen_utils.dart';
import 'login_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // Close the keyboard after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusManager.instance.primaryFocus?.unfocus(); // Close the keyboard
    });

    // Navigate to LoginScreen after 7 seconds
    Timer(const Duration(seconds: 7), () {
      // Close the keyboard before navigation
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth(context);

    return Scaffold(
      backgroundColor: AppColors.white, // Use constant
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie Animation
            Lottie.asset(
              'assets/animations/loading.json',
              width: screenWidth * 0.5, // Responsive width
            ),
            const SizedBox(height: AppSizes.fieldSpacing / 2), // Use constant
            // Logo
          ],
        ),
      ),
    );
  }
}
