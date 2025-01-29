import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/widgets/custom_slider/custom_slider_widget.dart';
import 'package:provider/provider.dart';

class SlidersSection extends StatelessWidget {
  const SlidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<EmotionsScreenViewModel>();
    final stressLevelValue = context.select((EmotionsScreenViewModel model) => model.stressLevelValue);
    final selfEsteemValue = context.select((EmotionsScreenViewModel model) => model.selfEsteemValue);
    final isFeelingSelected = context.select((EmotionsScreenViewModel model) => model.selectedFeelings).isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        spacing: 20,
        children: [
          CustomSliderWidget(
            title: 'Уровень стресса',
            minValueName: 'Низкий',
            maxValueName: 'Высокий',
            currentValue: stressLevelValue,
            onChanged: isFeelingSelected ? model.changeStressLevelValue : null,
          ),
          CustomSliderWidget(
            title: 'Самооценка',
            minValueName: 'Неуверенность',
            maxValueName: 'Уверенность',
            currentValue: selfEsteemValue,
            onChanged: isFeelingSelected ? model.changeSelfEsteemValue : null,
          ),
        ],
      ),
    );
  }
}