import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/screens/calendar_screen/month_widget.dart';
import 'package:mood_diary/ui/screens/calendar_screen/month_widget_description.dart';
import 'package:provider/provider.dart';

class ScrollableMonthsWidget extends StatefulWidget {
  const ScrollableMonthsWidget({super.key});

  @override
  State<ScrollableMonthsWidget> createState() => _ScrollableMonthsWidgetState();
}

class _ScrollableMonthsWidgetState extends State<ScrollableMonthsWidget> {
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
            description: MonthlyCalendarMonthDescription(),
          );
        }
        return child;
      },
    );
  }

  void _getFixedHeight(BuildContext context) {
    final model = context.read<CalendarScreenViewModel>();
    if(model.yearTextKey.currentContext != null) {
      final RenderBox yearTextRenderBox = model.yearTextKey.currentContext
          ?.findRenderObject() as RenderBox;
      final RenderBox monthTextRenderBox = model.monthTextKey.currentContext
          ?.findRenderObject() as RenderBox;
      final RenderBox dayCellRenderBox = model.dayCellKey.currentContext
          ?.findRenderObject() as RenderBox;
      model.yearTextHeight = yearTextRenderBox.size.height;
      model.monthTextHeight = monthTextRenderBox.size.height;
      model.dayCellHeight = dayCellRenderBox.size.height;
    }
  }

  @override
  void initState() {
    final model = context.read<CalendarScreenViewModel>();

    if(model.yearTextHeight == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>  _getFixedHeight(context));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<CalendarScreenViewModel>();

    return Expanded(
      child: CustomScrollView(
        controller: model.monthlyCalendarController,
        scrollDirection: Axis.vertical,
        anchor: 0,
        center: _initialMonthKey,
        slivers: [
          _getList(false, model.selectedMonth),
          SliverToBoxAdapter(
            key: _initialMonthKey,
            child: MonthWidget(
              monthDate: model.selectedMonth,
              description: MonthlyCalendarMonthDescription(),
            ),
          ),
          _getList(true, model.selectedMonth),
        ],
      )
    );
  }
}
