import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff98f54e);
  static const backgroundColor = Color(0xFFE8F5E9);
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
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const buttonTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
  );
}

class AppSizes {
  static const double logoWidth = 150;
  static const double buttonHorizontalPadding = 80;
  static const double buttonVerticalPadding = 15;
  static const double formHorizontalPadding = 20;
  static const double formVerticalPadding = 30;
  static const double fieldSpacing = 20;
  static const double borderRadius = 10;
}

const Color activatedRowColor = Color.fromARGB(255, 171, 227, 245);
const Color gridBorderColor = Color.fromARGB(255, 223, 222, 222);
const Color rowColor = Colors.white;
const Color checkedColor = Color.fromARGB(255, 37, 232, 34);
const int defaultPageSize = 5;
const List<int> pageSizeOptions = [10, 20, 50];
