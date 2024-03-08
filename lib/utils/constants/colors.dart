import 'package:flutter/material.dart';

class TColors {
  TColors._();
  //App Basic Colors
  static const Color primaryColor = Colors.green;
  static const Color secondaryColor = Colors.yellow;
  static const Color accent = Colors.greenAccent;

  //Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Colors.green,
        Colors.lightGreenAccent,
        Colors.yellowAccent,
      ]);

  //Text Colors

  // Background Colors

  // Background Container Colors

  //Border Colors

  //Button Colors

  //Error and Validation Colors
  static const Color error = Colors.redAccent;
  static const Color success = Colors.redAccent;
  static const Color warning = Colors.redAccent;
  static const Color info = Colors.redAccent;

  //Neutral Shades
}
