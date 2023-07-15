import 'package:flutter/material.dart';

class AppTheme{
  static get  buildThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(elevation: 0,color: Colors.white),
    );
  }

}