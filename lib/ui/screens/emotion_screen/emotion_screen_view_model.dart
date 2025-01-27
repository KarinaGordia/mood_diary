import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmotionsScreenViewModel extends ChangeNotifier{
  var day = DateTime.now().day;
  var monthIndex = DateTime.now().month;
  static const russianMonthsInGenitiveCase = <int, String>{
    1:'января',
    2:'февраля',
    3:'марта',
    4:'апреля',
    5:'мая',
    6:'июня',
    7:'июля',
    8:'августа',
    9:'сентября',
    10:'октября',
    11:'ноября',
    12:'декабря',
  };

  var time = DateFormat.Hm().format(DateTime.now());

  void updateTime() {
    day = DateTime.now().day;
    monthIndex = DateTime.now().month;
    time = DateFormat.Hm().format(DateTime.now());
    notifyListeners();
  }

  String createTitle() => '$day ${russianMonthsInGenitiveCase[monthIndex]} $time';

}