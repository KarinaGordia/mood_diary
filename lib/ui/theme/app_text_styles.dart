import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';

abstract class AppTextStyles{
  static var appBarTimeTitle = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.grey2,
  );
}