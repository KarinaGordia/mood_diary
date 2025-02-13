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
        height: 22 / 12,
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
    chipTheme: ChipThemeData(
      showCheckmark: false,
      selectedColor: AppColors.mandarin,
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      elevation: 4,
      pressElevation: 4,
      shadowColor: AppColors.shadow,
      selectedShadowColor: AppColors.shadow,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      labelStyle: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 11,
        height: 15 / 11,
        color: AppColors.black,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.white,
      contentTextStyle: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.black,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontFamily: GoogleFonts.nunito().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 44)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(69.0)),
        ),
      ),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 22 / 18,
        color: AppColors.grey2,
      ),
      bodyLarge: TextStyle(
  fontFamily: GoogleFonts.nunito().fontFamily,
  fontWeight: FontWeight.w800,
  fontSize: 16,
  color: AppColors.black,),
      labelLarge: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.black,
      ),
    ),
  );
}
