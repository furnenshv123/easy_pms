import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
        primaryColor: const Color.fromRGBO(75, 73, 164, 1),
        highlightColor: const Color.fromRGBO(205, 56, 56, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        textTheme: const TextTheme(
            labelSmall: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            titleSmall: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            titleLarge: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 48),
            titleMedium: TextStyle(
                color: Colors.black,
                fontFamily: "Inter",
                fontSize: 24,
                fontWeight: FontWeight.w800),
            displayMedium: TextStyle(
                color: Color.fromRGBO(171, 170, 170, 1),
                fontFamily: "Inter",
                fontSize: 18,
                fontWeight: FontWeight.w800)));
  }
}
