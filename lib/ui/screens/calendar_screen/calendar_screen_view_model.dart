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
}