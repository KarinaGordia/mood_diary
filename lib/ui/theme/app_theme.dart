import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mandarin),
  primaryColor: AppColors.mandarin,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundLight,
    surfaceTintColor: AppColors.backgroundLight,
  ),
);