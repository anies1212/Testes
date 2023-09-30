import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = Provider<ThemeData>(
  (ref) {
    return ThemeData(
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
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
      ),
    );
  },
);
