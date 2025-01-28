import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mandarin),
    primaryColor: AppColors.mandarin,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      surfaceTintColor: AppColors.backgroundLight,
    ),
    tabBarTheme: TabBarTheme(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(47.0),
        color: AppColors.mandarin,
      ),
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.white,
      ),
      unselectedLabelColor: AppColors.grey2,
      unselectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.grey2,
      ),
      dividerHeight: 0,
    ),
  );
}