import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({
    super.key, required this.monthDate,
  });

  final DateTime monthDate;

  @override
  Widget build(BuildContext context) {
    final month = CalendarScreenViewModel.russianMonthNames[monthDate.month - 1];
    final year = DateFormat.y().format(monthDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          year,
          style: AppTextStyles.year,
        ),
        Text(
          month,
          style: AppTextStyles.monthBig,
        ),
        Container(
          height: 150,
        ),
      ],
    );
  }
}
