import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_app_bar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CalendarAppBar(),
    );
  }
}

