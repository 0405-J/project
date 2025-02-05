// screen_utils.dart
import 'package:flutter/widgets.dart';

class ScreenUtils {
  // Get proportional padding based on screen height
  static double getProportionalHeightPadding(BuildContext context,
      {double proportion = 0.1}) {
    return MediaQuery.of(context).size.height * proportion;
  }

  // Get proportional padding based on screen width
  static double getProportionalWidthPadding(BuildContext context,
      {double proportion = 0.1}) {
    return MediaQuery.of(context).size.width * proportion;
  }

  // Get responsive font size based on screen width
  static double getResponsiveFontSize(BuildContext context,
      {double scaleFactor = 0.04}) {
    return MediaQuery.of(context).size.width * scaleFactor;
  }

  // Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getFontSize(BuildContext? context) {
    if (context == null) return 14;
    return MediaQuery.of(context).size.width < 600 ? 12 : 14;
  }
}
