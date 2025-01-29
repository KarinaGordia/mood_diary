import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/screens/calendar_screen/month_widget_description.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({
    super.key,
    required this.monthDate,
    required this.description,
  });

  final DateTime monthDate;
  final MonthDescription description;

  @override
  Widget build(BuildContext context) {
    final month =
        CalendarScreenViewModel.russianMonthNames[monthDate.month - 1];
    final year = DateFormat.y().format(monthDate);
    final model = context.read<CalendarScreenViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description.showYear)
          GestureDetector(
            onTap: () {
              model.selectYear(monthDate.year);
              model.showAnnualCalendar(context);
            },
            child: Text(
              year,
              key: CalendarFunctions.isCurrentMonth(monthDate) ? model.yearTextKey : null,
              style: TextStyle(
                fontFamily: GoogleFonts.nunito().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: description.yearFontSize,
                color: AppColors.grey2,
              ),
            ),
          ),
        Text(
          month,
          key: CalendarFunctions.isCurrentMonth(monthDate) ? model.monthTextKey : null,
          style: TextStyle(
            fontFamily: GoogleFonts.nunito().fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: description.monthFontSize,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),
        _DayCellBuilderWidget(
          month: monthDate.month,
          cells: model.generateMonthCells(monthDate),
          description: description,
        )
      ],
    );
  }
}

class _DayCellBuilderWidget extends StatelessWidget {
  const _DayCellBuilderWidget({
    super.key,
    required this.month,
    required this.cells,
    required this.description,
  });

  final List<DateTime> cells;
  final int month;
  final MonthDescription description;

  @override
  Widget build(BuildContext context) {
    final model = context.read<CalendarScreenViewModel>();

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 0,
          crossAxisSpacing: description.cellBuilderCrossAxisSpacing,
        ),
        itemCount: cells.length,
        itemBuilder: (context, index) {
          var date = cells[index];

          var isSameMonth = date.month == month;
          if (!isSameMonth) {
            return Container();
          }

          bool isToday = CalendarFunctions.isToday(date);
          return _DayCellWidget(
            date: date,
            key: isToday ? model.dayCellKey : null,
            description: description,
          );
        });
  }
}

class _DayCellWidget extends StatelessWidget {
  const _DayCellWidget({
    super.key,
    required this.date,
    required this.description,
  });

  final DateTime date;
  final MonthDescription description;

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
          if (isToday)
            _TodayMarkWidget(size: description.todayMarkSize,),
          Text(
            day,
            style: TextStyle(
              fontFamily: GoogleFonts.nunito().fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: description.dayFontSize,
              color: AppColors.black,
            ),
          ),
          if (isSelected)
            const _SelectionAreaWidget(),
        ],
      ),
    );
  }
}

class _TodayMarkWidget extends StatelessWidget {
  const _TodayMarkWidget({super.key, required this.size});

  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      child: Container(
        width: size,
        height: size,
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
