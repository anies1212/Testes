import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = Provider<ThemeData>(
  (ref) {
    return ThemeData.light().copyWith(
        textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 1000),
      displayMedium: TextStyle(fontSize: 24),
      displaySmall: TextStyle(fontSize: 12),
    ));
  },
);
