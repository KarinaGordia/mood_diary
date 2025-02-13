import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/calendar_screen/annual_calendar_screen/annual_calendar_screen.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/screens/calendar_screen/monthly_calendar_screen/monthly_calendar_screen.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainNavigationNames {
  static const diary = '/';
  static const monthlyCalendar = '/monthly_calendar';
  static const annualCalendar = '/monthly_calendar/annual_calendar';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationNames.diary: (_) => ChangeNotifierProvider(
          create: (_) => EmotionsScreenViewModel(),
          child: const EmotionsScreen(),
        ),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationNames.monthlyCalendar:
        final arguments = settings.arguments;
        final model = arguments is CalendarScreenViewModel ? arguments : null;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: model,
            child: MonthlyCalendarScreen(),
          ),
        );
      case MainNavigationNames.annualCalendar:
        final arguments = settings.arguments;
        final model = arguments is CalendarScreenViewModel ? arguments : null;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: model,
            child: AnnualCalendarScreen(),
          ),
        );
      default:
        const widget = Scaffold(
          body: Center(
            child: Text('Navigation error'),
          ),
        );
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
