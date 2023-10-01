import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = Provider<ThemeData>(
  (ref) {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
        ),
        bodyLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  },
);
