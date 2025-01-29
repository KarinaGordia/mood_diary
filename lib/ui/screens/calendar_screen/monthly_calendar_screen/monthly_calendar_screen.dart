import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_app_bar.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/screens/calendar_screen/monthly_calendar_screen/scrollable_months_widget.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';

class MonthlyCalendarScreen extends StatelessWidget {
  const MonthlyCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CalendarScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const DaysOfWeekRow(),
            ScrollableMonthsWidget(),
          ],
        ),
      ),
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

