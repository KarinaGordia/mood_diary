import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';

abstract class MonthDescription {
  double? get yearFontSize;
  double get monthFontSize;
  double get cellBuilderCrossAxisSpacing;
  double get todayMarkSize;
  double get dayFontSize;
  EdgeInsetsGeometry get monthWidgetPadding;
  bool get showYear;

}

class MonthlyCalendarMonthDescription implements MonthDescription {
  @override
  final double yearFontSize;
  @override
  final double monthFontSize;
  @override
  final double cellBuilderCrossAxisSpacing;
  @override
  final double todayMarkSize;
  @override
  final double dayFontSize;
  @override
  final EdgeInsetsGeometry monthWidgetPadding;
  @override
  bool get showYear => true;


  MonthlyCalendarMonthDescription( {
    this.yearFontSize = 16,
    this.monthFontSize = 24,
    this.cellBuilderCrossAxisSpacing = 8,
    this.todayMarkSize = 5,
    this.dayFontSize = 18,
    this.monthWidgetPadding = const EdgeInsets.only(bottom: 16),
  }) ;
}

class AnnualCalendarMonthDescription implements MonthDescription {
  @override
  final double? yearFontSize;
  @override
  final double monthFontSize;
  @override
  final double cellBuilderCrossAxisSpacing;
  @override
  final double todayMarkSize;
  @override
  final double dayFontSize;
  @override
  final EdgeInsetsGeometry monthWidgetPadding;
  @override
  bool get showYear => false;

  AnnualCalendarMonthDescription({
    this.yearFontSize,
    this.monthFontSize = 14,
    this.cellBuilderCrossAxisSpacing = 3.5,
    this.todayMarkSize = 3,
    this.dayFontSize = 10,
    this.monthWidgetPadding = EdgeInsets.zero,
  });
}
