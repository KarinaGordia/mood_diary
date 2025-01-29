import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';

abstract class AppTextStyles {

  //display
  static final monthBig = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 22 / 24,
    color: AppColors.black,
  );

  static TextStyle appBarTimeTitle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 22 / 18,
    color: AppColors.grey2,
  );

  static final year = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 22 / 16,
    color: AppColors.grey2,
  );

  final month = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.grey2,
  );

  static TextStyle today = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    // height: 22 / 18,
    color: AppColors.grey2,
  );

//body
  final yearBig = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 26,
    color: AppColors.black,
  );

  static TextStyle sectionTitle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: AppColors.black,
  );

//same
  static TextStyle basic = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 15 / 11,
    color: AppColors.black,
  );

  //slider value text
  final valueTextStyle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: AppColors.grey3,
  );


// label large
  static TextStyle hintTextStyle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.grey2,
  );

  static TextStyle contentTextStyle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.black,
  );


  final calendarDays = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: AppColors.black,
  );
  static TextStyle daysOfWeek = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: AppColors.grey2,
  );

  static final dayBig = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 20/18,
    color: AppColors.black,
  );

  final day = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 10,
    // height: 20/18,
    color: AppColors.black,
  );


}
