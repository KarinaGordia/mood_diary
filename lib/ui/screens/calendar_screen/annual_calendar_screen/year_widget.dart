import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/screens/calendar_screen/month_widget.dart';
import 'package:mood_diary/ui/screens/calendar_screen/month_widget_description.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class YearWidget extends StatelessWidget {
  const YearWidget({super.key, required this.year});

  final int? year;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text('$year', style: AppTextStyles.yearBig),
        MonthGridViewWidget(year: year),
      ],
    );
  }
}

class MonthGridViewWidget extends StatelessWidget {
  const MonthGridViewWidget({super.key, required this.year});

  final int? year;

  @override
  Widget build(BuildContext context) {
    final model = context.read<CalendarScreenViewModel>();
    // final model = CalendarScreenWidgetModelProvider.watch(context)?.model;
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.05,
          mainAxisSpacing: 20,
          crossAxisSpacing: 35,
        ),
        itemCount: CalendarScreenViewModel.russianMonthNames.length,
        itemBuilder: (context, index) {
          var monthDate = DateTime(year!, index + 1, 1);
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              log('select month ${monthDate.month}');
              model.selectMonth(monthDate);
              model.showMonthlyCalendar(context);
              // model?.changeCalendarFormat();
              // model?.selectedMonthDate = monthDate;
            },
            child: MonthWidget(
              monthDate: monthDate,
              description: AnnualCalendarMonthDescription(),
            ),
          );
        });
  }
}
