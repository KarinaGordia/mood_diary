import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/screens/calendar_screen/monthly_calendar/scrollable_calendar.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';

class MonthlyCalendar extends StatelessWidget {
  const MonthlyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DaysOfWeekRow(),
        ScrollableCalendarWidget(),
      ],
    );
  }
}

class DaysOfWeekRow extends StatelessWidget {
  const DaysOfWeekRow({super.key});

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = CalendarScreenViewModel.russianDaysOfWeek;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            daysOfWeek.length, (index) {
          return Expanded(
            child: Text(
              daysOfWeek[index],
              textAlign: TextAlign.center,
              style: AppTextStyles.daysOfWeek,
            ),
          );
        }),
      ),
    );
  }
}

