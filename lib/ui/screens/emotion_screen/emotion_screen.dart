import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_tabs.dart';
import 'package:mood_diary/ui/screens/emotion_screen/time_widget.dart';


class EmotionsScreen extends StatelessWidget {
  const EmotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.zero,
          title: const TimeWidget(),
        ),
      ),
      body: EmotionScreenTabs(),
    );
  }
}


