import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/screens/calendar_screen/month_widget.dart';
import 'package:provider/provider.dart';

class ScrollableCalendarWidget extends StatelessWidget {
  ScrollableCalendarWidget({super.key});

  final UniqueKey _initialMonthKey = UniqueKey();

  Widget _getList(bool isForward, DateTime date) {
    return SliverList.builder(
      itemBuilder: (BuildContext context, int index) {
        final Widget child;
        var monthDate = isForward
            ? DateTime(date.year, date.month + index, 1)
            : DateTime(date.year, date.month - index, 1);
        if (index == 0) {
          child = const SizedBox.shrink();
        } else {
          child = MonthWidget(
            monthDate: monthDate,
          );
        }
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<CalendarScreenViewModel>();
    final selectedDate = model.selectedMonthDate ?? model.today;

    return Expanded(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        anchor: 0,
        center: _initialMonthKey,
        slivers: [
          _getList(false, selectedDate),
          SliverToBoxAdapter(
            key: _initialMonthKey,
            child: MonthWidget(
              monthDate: selectedDate,
            ),
          ),
          _getList(true, selectedDate),
        ],
      )
    );
  }
}
