import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mood_diary/ui/navigation/main_navigation.dart';

abstract class CalendarFunctions {
  static DateTime todayFormatted =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  static bool isToday(DateTime date) {
    return todayFormatted.compareTo(date) == 0;
  }

  static bool isCurrentMonth(DateTime date) {
    return DateTime(DateTime.now().year, DateTime.now().month)
            .compareTo(DateTime(date.year, date.month)) ==
        0;
  }

  static bool isSameDate(DateTime firstDate, DateTime secondDate) {
    return firstDate.compareTo(secondDate) == 0;
  }
}

class OffsetCalculator {
   OffsetCalculator({
    required this.currentMonth,
    required this.yearTextHeight,
    required this.monthTextHeight,
    required this.dayCellHeight,
  });

  final DateTime currentMonth;
  final double yearTextHeight;
  final double monthTextHeight;
  final double dayCellHeight;

  Map<int, double> monthHeights = {};

  double calculateOffsetBetweenMonths(DateTime selected) {
    final isCurrentMonth = CalendarFunctions.isCurrentMonth(selected);
    double totalOffset = 0;

    if (isCurrentMonth) return totalOffset;

    DateTime startDate =
        currentMonth.isBefore(selected) ? currentMonth : selected;
    DateTime endDate =
        currentMonth.isBefore(selected) ? selected : currentMonth;

    while (startDate.isBefore(endDate)) {
      int weeksInMonth = getWeeksInMonth(startDate);
      double monthHeight = calculateMonthHeight(weeksInMonth);
      totalOffset += monthHeight;

      startDate = DateTime(startDate.year, startDate.month + 1, 1);
    }

    return currentMonth.isBefore(selected) ? -totalOffset : totalOffset;
  }

  int getWeeksInMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    DateTime lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    int firstDayWeekday = firstDayOfMonth.weekday;
    int daysInMonth = lastDayOfMonth.day;
    int totalDaysWithOffset = firstDayWeekday - 1 + daysInMonth;
    int weeks = (totalDaysWithOffset / 7).ceil();

    return weeks;
  }

  double calculateMonthHeight(int weeksInMonth) {
    final heightFromMap = monthHeights[weeksInMonth];
    if (monthHeights[weeksInMonth] != null) {
      return heightFromMap!;
    }

    const heightBetweenYearAndMonth = 10.0;
    double fixedHeight =
        yearTextHeight + monthTextHeight + heightBetweenYearAndMonth;
    double monthHeight = fixedHeight + (weeksInMonth * dayCellHeight);
    monthHeights[weeksInMonth] = monthHeight;
    return monthHeight;
  }
}

class CalendarScreenViewModel extends ChangeNotifier {
  CalendarScreenViewModel() {
    log('calendar screen view model constructor');
    _selectedDay = CalendarFunctions.todayFormatted;
    _selectedMonth = CalendarFunctions.todayFormatted;
    monthlyCalendarController = ScrollController();
    yearTextKey = GlobalKey();
    monthTextKey = GlobalKey();
    dayCellKey = GlobalKey();
  }

  static const russianDaysOfWeek = <String>[
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС'
  ];

  static const russianMonthNames = <String>[
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  late final ScrollController monthlyCalendarController;
  late DateTime _selectedDay;
  late DateTime _selectedMonth;
  int? _selectedYear;

  late final GlobalKey yearTextKey;
  late final GlobalKey monthTextKey;
  late final GlobalKey dayCellKey;

  DateTime get selectedDay => _selectedDay;

  DateTime get selectedMonth => _selectedMonth;

  int? get selectedYear => _selectedYear;

  bool _isMonthlyCalendarMode = true;

  bool get isMonthlyCalendarMode => _isMonthlyCalendarMode;

  double yearTextHeight = 0;
  double monthTextHeight = 0;
  double dayCellHeight = 0;
  double calculateOffsetToCurrentMonth() {
    final offsetCalculator = OffsetCalculator(
      currentMonth: _selectedMonth,
      yearTextHeight: yearTextHeight,
      monthTextHeight: monthTextHeight,
      dayCellHeight: dayCellHeight,
    );

    final offset = offsetCalculator.calculateOffsetBetweenMonths(_selectedMonth);

    return offset;
  }

  void selectDay(DateTime date) {
    if (_selectedDay != date) {
      _selectedDay = date;
      notifyListeners();
    }
  }

  void selectMonth(DateTime monthDate) {
    if (_selectedMonth != monthDate) {
      _selectedMonth = monthDate;
    }
  }

  void selectYear(int year) {
    if (_selectedYear != year) {
      _selectedYear = year;
    }
  }

  List<DateTime> generateMonthCells(DateTime monthDate) {
    var cells = <DateTime>[];
    var month = monthDate.month;
    var year = monthDate.year;
    var totalDaysInMonth = DateUtils.getDaysInMonth(year, month);
    var firstDayDt = DateTime(year, month, 1);
    var previousMonthDt = firstDayDt.subtract(const Duration(days: 1));

    var firstDayOfWeek = firstDayDt.weekday;
    var previousMonthDays =
        DateUtils.getDaysInMonth(previousMonthDt.year, previousMonthDt.month);

    var previousMonthCells = List.generate(
        firstDayOfWeek - 1,
        (index) => DateTime(previousMonthDt.year, previousMonthDt.month,
            previousMonthDays - index));
    cells.addAll(previousMonthCells.reversed);

    List<DateTime> currentMonthCells = List.generate(
        totalDaysInMonth, (index) => DateTime(year, month, index + 1));
    cells.addAll(currentMonthCells);
    return cells;
  }

  void showMonthlyCalendar(BuildContext context) {
    _isMonthlyCalendarMode = true;
    log('navigate to monthly calendar');
    Navigator.of(context).pushNamed(
      MainNavigationNames.monthlyCalendar,
      arguments: this,
    );
  }

  void showAnnualCalendar(BuildContext context) {
    _isMonthlyCalendarMode = false;
    log('navigate to annual calendar');
    Navigator.of(context).pushNamed(
      MainNavigationNames.annualCalendar,
      arguments: this,
    );
  }

  @override
  void dispose() {
    monthlyCalendarController.dispose();
    super.dispose();
  }
}
