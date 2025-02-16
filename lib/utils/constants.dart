import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xffE67E22);
  static const hoverColor = Color(0xffF5A25D);
  // Orange
  static const backgroundColor = Color(0xFFFFF3E0); // Light orange
  static const textColor = Color(0xFF333333);
  static const white = Colors.white;
}

class AppTextStyles {
  static const headingStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const welcomeStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black87, // Stronger visibility
  );

  static const buttonTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
  );
}

class AppSizes {
  static const double logoWidth = 200;
  static const double buttonHorizontalPadding = 80;
  static const double buttonVerticalPadding = 15;
  static const double formHorizontalPadding = 20;
  static const double formVerticalPadding = 30;
  static const double buttonPadding = 15;
  static const double formPadding = 30;
  static const double fieldSpacing = 20;
  static const double borderRadius = 10;
}

const Color activatedRowColor = Color.fromARGB(255, 171, 227, 245);
const Color gridBorderColor = Color.fromARGB(255, 223, 222, 222);
const Color rowColor = Colors.white;
const Color checkedColor = Color.fromARGB(255, 37, 232, 34);
const int defaultPageSize = 10;
const List<int> pageSizeOptions = [10, 20, 50];
