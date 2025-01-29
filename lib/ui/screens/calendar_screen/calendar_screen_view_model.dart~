import 'package:flutter/material.dart';

class CalendarScreenViewModel extends ChangeNotifier{
  CalendarScreenViewModel() {
    selectedMonthDate = today;
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

  final _today = DateTime.now();

  DateTime get today => DateTime(_today.year, _today.month, _today.day);

  DateTime? selectedMonthDate;

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