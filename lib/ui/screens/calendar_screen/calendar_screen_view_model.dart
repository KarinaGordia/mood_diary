import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mood_diary/ui/navigation/main_navigation.dart';

abstract class CalendarFunctions {
  static DateTime todayFormatted =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  static bool isToday(DateTime date) {
    return todayFormatted.compareTo(date) == 0;
  }

  static bool isSameDate(DateTime firstDate, DateTime secondDate) {
    return firstDate.compareTo(secondDate) == 0;
  }
}

class CalendarScreenViewModel extends ChangeNotifier {
  CalendarScreenViewModel() {
    log('calendar screen view model constructor');
    _selectedDay = CalendarFunctions.todayFormatted;
    _selectedMonth = CalendarFunctions.todayFormatted;
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

  late DateTime _selectedDay;
  late DateTime _selectedMonth;
  int? _selectedYear;

  DateTime get selectedDay => _selectedDay;

  DateTime get selectedMonth => _selectedMonth;

  int? get selectedYear => _selectedYear;

  bool _isMonthlyCalendarMode = true;

  bool get isMonthlyCalendarMode => _isMonthlyCalendarMode;

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
}
