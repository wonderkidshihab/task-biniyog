import 'package:flutter/material.dart';
import 'package:task/app/theme/app_colors.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary, secondary: AppColors.secondary),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 252, 249, 236),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 252, 249, 236),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.secondary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
