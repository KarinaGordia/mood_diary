import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/annual_calendar_screen/scrollable_years_widget.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_app_bar.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:provider/provider.dart';

class AnnualCalendarScreen extends StatelessWidget {
  const AnnualCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('in annual calendar build');
    final year = context.read<CalendarScreenViewModel>().selectedYear;
    log('$year');
    return Scaffold(
      appBar: const CalendarScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ScrollableYearsWidget(selectedYear: year!,),
      ),
    );
  }
}
