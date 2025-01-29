import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/domain/entity/feeling.dart';
import 'package:mood_diary/resources/app_images.dart';
import 'package:mood_diary/ui/navigation/main_navigation.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';


class EmotionsScreenViewModel extends ChangeNotifier {
  final _feelings = <Feeling>[
    Feeling(name: 'Радость', imagePath: AppImages.joy, subFeelings: [
      'Возбуждение',
      'Восторг',
      'Игривость',
      'Наслаждение',
      'Очарование',
      'Осознанность',
      'Смелость',
      'Удовольствие',
      'Чувственность',
      'Энергичность',
      'Экстравагантность'
    ]),
    Feeling(name: 'Страх', imagePath: AppImages.fear, subFeelings: [
      'Тревога',
      'Паника',
      'Беспокойство',
      'Опасение',
      'Ужас',
      'Нервозность',
      'Паранойя',
      'Неуверенность',
      'Напряженность',
      'Шок'
    ]),
    Feeling(name: 'Бешенство', imagePath: AppImages.rage, subFeelings: [
      'Ярость',
      'Злоба',
      'Гнев',
      'Обида',
      'Раздражение',
      'Атака',
      'Агрессия',
      'Взрыв',
      'Неприязнь',
      'Враждебность'
    ]),
    Feeling(name: 'Грусть', imagePath: AppImages.sadness, subFeelings: [
      'Печаль',
      'Тоска',
      'Грусть',
      'Разочарование',
      'Одиночество',
      'Уныние',
      'Жалость к себе',
      'Безнадежность',
      'Тревожность',
      'Опустошение'
    ]),
    Feeling(name: 'Спокойствие', imagePath: AppImages.calmness, subFeelings: [
      'Расслабленность',
      'Умиротворение',
      'Баланс',
      'Гармония',
      'Безмятежность',
      'Покой',
      'Стабильность',
      'Непоколебимость',
      'Отрешенность'
    ]),
    Feeling(name: 'Сила', imagePath: AppImages.strength, subFeelings: [
      'Мощь',
      'Храбрость',
      'Стойкость',
      'Настойчивость',
      'Дерзость',
      'Выносливость',
      'Воля',
      'Независимость',
      'Уверенность',
      'Твердость'
    ]),
  ];

  List<Feeling> get feelings => _feelings;

  final List<Feeling> _selectedFeelings = [];

  List<Feeling> get selectedFeelings => _selectedFeelings.toList();

  final List<String> _selectedSubFeelings = [];

  List<String> get selectedSubFeelings => _selectedSubFeelings.toList();

  final List<String> _displayedSubFeelings = [];

  List<String> get subFeelings => _displayedSubFeelings.toList();

  void selectFeeling(Feeling feeling) {
    feeling.isSelected = !feeling.isSelected;

    if (_selectedFeelings.contains(feeling)) {
      _selectedFeelings.remove(feeling);

      for (var subFeeling in feeling.subFeelings) {
        _selectedSubFeelings.remove(subFeeling);
      }

      if (selectedFeelings.isEmpty) {
        changeStressLevelValue(0.5);
        changeSelfEsteemValue(0.5);
      }
    } else {
      _selectedFeelings.add(feeling);
    }

    notifyListeners();
  }

  void selectSubFeeling(String subFeeling, bool isSelected) {
    isSelected = !isSelected;
    if (_selectedSubFeelings.contains(subFeeling)) {
      _selectedSubFeelings.remove(subFeeling);
    } else {
      _selectedSubFeelings.add(subFeeling);
    }

    notifyListeners();
  }

  void getSubFeelingList() {
    _displayedSubFeelings.clear();
    for (var feeling in _selectedFeelings) {
      _displayedSubFeelings.addAll(feeling.subFeelings);
    }
  }

  double _stressLevelValue = 0.5;

  double get stressLevelValue => _stressLevelValue;

  double _selfEsteemValue = 0.5;

  double get selfEsteemValue => _selfEsteemValue;

  void changeStressLevelValue(double value) {
    _stressLevelValue = value;
    notifyListeners();
  }

  void changeSelfEsteemValue(double value) {
    _selfEsteemValue = value;
    notifyListeners();
  }

  final textFieldController = TextEditingController();

  String? _noteText;

  void takeNote(String text) {
    final noteText = text.trim().isNotEmpty ? text : null;

    if (noteText != null) {
      notifyListeners();
    }

    _noteText = noteText;
  }

  bool isDiaryFilled() {
    bool isNoteTextNotEmpty = _noteText != null && _noteText!.isNotEmpty;
    return _selectedFeelings.isNotEmpty &&
        _selectedSubFeelings.isNotEmpty &&
        isNoteTextNotEmpty;
  }

  void resetSelection() {
    for (var feeling in _feelings) {
      feeling.isSelected = false;
    }

    _selectedFeelings.clear();
    _selectedSubFeelings.clear();
    _displayedSubFeelings.clear();

    changeStressLevelValue(0.5);
    changeSelfEsteemValue(0.5);

    textFieldController.clear();
    _noteText = null;

    notifyListeners();
  }

  var day = DateTime.now().day;
  var monthIndex = DateTime.now().month;
  static const russianMonthsInGenitiveCase = <int, String>{
    1: 'января',
    2: 'февраля',
    3: 'марта',
    4: 'апреля',
    5: 'мая',
    6: 'июня',
    7: 'июля',
    8: 'августа',
    9: 'сентября',
    10: 'октября',
    11: 'ноября',
    12: 'декабря',
  };

  var time = DateFormat.Hm().format(DateTime.now());

  void updateTime() {
    day = DateTime.now().day;
    monthIndex = DateTime.now().month;
    time = DateFormat.Hm().format(DateTime.now());
    notifyListeners();
  }

  String createTitle() =>
      '$day ${russianMonthsInGenitiveCase[monthIndex]} $time';

  void showCalendar(BuildContext context, CalendarScreenViewModel model) {
    Navigator.of(context).pushNamed(MainNavigationNames.monthlyCalendar, arguments: model);
  }
}
