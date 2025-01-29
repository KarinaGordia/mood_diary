import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/annual_calendar_screen/scrollable_years_widget.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_app_bar.dart';

class AnnualCalendarScreen extends StatelessWidget {
  const AnnualCalendarScreen({super.key, required this.year});

  final int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CalendarScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ScrollableYearsWidget(selectedYear: year,),
      ),
    );
  }
}
