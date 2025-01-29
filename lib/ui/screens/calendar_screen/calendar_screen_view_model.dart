import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/annual_calendar_screen/annual_calendar_screen.dart';
import 'package:provider/provider.dart';

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

  late DateTime _selectedDay;
  late DateTime _selectedMonthDate;
  int? _selectedYear;

  DateTime get selectedDay => _selectedDay;

  DateTime get selectedMonthDate => _selectedMonthDate;

  int? get selectedYear => _selectedYear;

  void selectDay(DateTime date) {
    if (_selectedDay != date) {
      _selectedDay = date;
      notifyListeners();
    }
  }

  void selectYear(int year) {
    if (_selectedYear != year) {
      _selectedYear = year;
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

  void showCalendar(BuildContext context, int selectedYear) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider.value(
            value: this,
            child: AnnualCalendarScreen(
              year: selectedYear,
            )),
      ),
    );
  }
}
