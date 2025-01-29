import 'package:flutter/material.dart';
import 'package:mood_diary/ui/navigation/main_navigation.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Diary',
      theme: AppTheme.defaultTheme,
      initialRoute: MainNavigationNames.diary,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
