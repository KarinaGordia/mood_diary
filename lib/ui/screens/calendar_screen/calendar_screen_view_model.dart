import 'package:flutter/material.dart';

abstract class CalendarFunctions {
  static DateTime todayFormatted = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  static bool isToday(DateTime date) {
    return todayFormatted.compareTo(date) == 0;
  }

  static bool isSameDate(DateTime firstDate, DateTime secondDate) {
    return firstDate.compareTo(secondDate) == 0;
  }
}

class CalendarScreenViewModel extends ChangeNotifier {
  CalendarScreenViewModel() {
    _selectedDay = CalendarFunctions.todayFormatted;
    _selectedMonthDate = CalendarFunctions.todayFormatted;
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

  late DateTime _selectedMonthDate;
  DateTime get selectedMonthDate => _selectedMonthDate;

  late DateTime _selectedDay;
  DateTime get selectedDay => _selectedDay;

  void selectDay(DateTime date) {
    if(_selectedDay != date) {
      _selectedDay = date;
      notifyListeners();
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
}


