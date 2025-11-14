import 'package:flutter/material.dart';

class Responsiveness {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  static double width(double percent) => blockWidth * percent;
  static double height(double percent) => blockHeight * percent;
  static double text(double size) => (size / 390) * screenWidth;
}
