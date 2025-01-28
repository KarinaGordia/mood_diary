import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/screens/emotion_screen/mood_diary_tab/feelings_section.dart';
import 'package:mood_diary/ui/screens/emotion_screen/mood_diary_tab/notes_section.dart';
import 'package:mood_diary/ui/screens/emotion_screen/mood_diary_tab/sliders_section.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class MoodDiaryTab extends StatelessWidget {
  const MoodDiaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  FeelingsSection(),
                  SlidersSection(),
                  NotesSection(),
                ],
              ),
            ),
          ),
          SaveButton(),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Запись успешно сохранена!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final resetSelection = context.read<EmotionsScreenViewModel>().resetSelection;
    final isDiaryFilled = context
        .select((EmotionsScreenViewModel model) => model.isDiaryFilled());
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, right: 20.0),
      child: FilledButton(
          style: ButtonStyle(
            backgroundColor: isDiaryFilled
                ? const WidgetStatePropertyAll(AppColors.mandarin)
                : null,
          ),
          onPressed: isDiaryFilled ? () => {
            _showSnackBar(context),
            resetSelection(),
          } : null,
          child: const Text('Сохранить')),
    );
  }
}
