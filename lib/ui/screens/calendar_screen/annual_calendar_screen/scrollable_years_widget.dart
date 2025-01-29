import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/annual_calendar_screen/year_widget.dart';

class ScrollableYearsWidget extends StatelessWidget {
  ScrollableYearsWidget({super.key, required this.selectedYear,});

  final int selectedYear;
  final UniqueKey _initialYearKey = UniqueKey();

  Widget _getList(bool isForward, int year) {
    return SliverList.builder(
      itemBuilder: (BuildContext context, int index) {
        final Widget child;
        if (index == 0) {
          child = const SizedBox.shrink();
        } else {
          child = YearWidget(year: isForward ? (year + index) : (year - index));
        }
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      anchor: 0,
      center: _initialYearKey,
      slivers: <Widget>[
        _getList(false, selectedYear),
        SliverToBoxAdapter(
          key: _initialYearKey,
          child: YearWidget(year: selectedYear),
        ),
        _getList(true, selectedYear),
      ],
    );
  }
}
