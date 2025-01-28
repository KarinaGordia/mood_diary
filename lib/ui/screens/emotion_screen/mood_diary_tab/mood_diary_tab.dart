import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mood_diary/domain/entity/feeling.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/screens/emotion_screen/mood_diary_tab/feelings_section.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class MoodDiaryTab extends StatelessWidget {
  const MoodDiaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FeelingsSection();
  }
}


