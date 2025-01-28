import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle appBarTimeTitle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 22 / 18,
    color: AppColors.grey2,
  );
  static TextStyle sectionTitle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: AppColors.black,
  );
  static TextStyle basic = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 15 / 11,
    color: AppColors.black,
  );
}
