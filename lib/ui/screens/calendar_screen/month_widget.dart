import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({
    super.key,
    required this.monthDate,
  });

  final DateTime monthDate;

  @override
  Widget build(BuildContext context) {
    final month =
        CalendarScreenViewModel.russianMonthNames[monthDate.month - 1];
    final year = DateFormat.y().format(monthDate);
    final model = context.read<CalendarScreenViewModel>();

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
        const SizedBox(
          height: 10,
        ),
        DayCellBuilderWidget(
          month: monthDate.month,
          cells: model.generateMonthCells(monthDate),
        )
      ],
    );
  }
}

class DayCellBuilderWidget extends StatelessWidget {
  const DayCellBuilderWidget({
    super.key,
    required this.month,
    required this.cells,
  });

  final List<DateTime> cells;
  final int month;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 0,
          crossAxisSpacing: 8,
        ),
        itemCount: cells.length,
        itemBuilder: (context, index) {
          var date = cells[index];

          var isSameMonth = date.month == month;
          if (!isSameMonth) {
            return Container();
          }

          return _DayCellWidget(
            date: date,
          );
        });
  }
}

class _DayCellWidget extends StatelessWidget {
  const _DayCellWidget({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final day = date.day.toString();
    final bool isToday = CalendarFunctions.isToday(date);
    final model = context.read<CalendarScreenViewModel>();
    final selectedDay =
        context.select((CalendarScreenViewModel model) => model.selectedDay);
    final bool isSelected = CalendarFunctions.isSameDate(selectedDay, date);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        model.selectDay(date);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isToday) const _TodayMarkWidget(),
          Text(day, style: AppTextStyles.dayBig),
          if(isSelected) const _SelectionAreaWidget(),
        ],
      ),
    );
  }
}

class _TodayMarkWidget extends StatelessWidget {
  const _TodayMarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      child: Container(
        width: 5,
        height: 5,
        decoration: const BoxDecoration(
          color: AppColors.mandarin,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SelectionAreaWidget extends StatelessWidget {
  const _SelectionAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1.5),
      decoration: const BoxDecoration(
        color: AppColors.mandarinTransparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
