import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      primaryColor: const Color(0xFFFFE6CF),
      hintColor: Colors.black,
      fontFamily: 'PlayFair Display',
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: const Color(0xFFFFE6CF),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black
        )
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: Color(0xFFde7006),
            fontFamily: "PlayFair Display",
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        displayLarge: TextStyle(
            color: Color(0xFF080a0b),
            fontFamily: "PlayFair Display",
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        displayMedium: TextStyle(
            color: Color(0xFF080a0b),
            fontFamily: "PlayFair Display",
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        displaySmall: TextStyle(
            color: Color(0xFF080a0b),
            fontFamily: "Inter",
            fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        bodyLarge: TextStyle(
            color: Color(0xFF080a0b),
            fontFamily: "Inter",
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(
            color: Color(0xFF080a0b),
            fontFamily: "Inter",
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
