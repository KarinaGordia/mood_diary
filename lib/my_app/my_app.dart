import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      home: ChangeNotifierProvider(
        create: (_) => EmotionsScreenViewModel(),
        child: const EmotionsScreen(),
      ),
    );
  }
}
