import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mood_diary/domain/entity/feeling.dart';
import 'package:mood_diary/resources/app_images.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class MoodDiaryTab extends StatelessWidget {
  const MoodDiaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    log('MoodDiaryTab build');
    final feelings = context.read<EmotionsScreenViewModel>().feelings;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Что чувствуешь?',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Container(
          height: 118,
          margin: const EdgeInsets.only(top: 12),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              var feeling = feelings[index];
              return FeelingButtonWidget(
                feeling: feeling,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 12,
              );
            },
          ),
        ),
      ],
    );
  }
}

class FeelingButtonWidget extends StatelessWidget {
  const FeelingButtonWidget({super.key, required this.feeling});

  final Feeling feeling;

  @override
  Widget build(BuildContext context) {
    log('feeling call: ${feeling.name} ${feeling.isSelected}');
    final model = context.read<EmotionsScreenViewModel>();
    final isSelected = context
        .select((EmotionsScreenViewModel model) => model.selectedFeelings)
        .contains(feeling);
    final border =
        isSelected ? Border.all(color: AppColors.mandarin, width: 2) : null;

    return InkWell(
      onTap: () {
        model.selectFeeling(feeling);
        // model.getSubFeelingList();
      },
      borderRadius: BorderRadius.circular(76),
      child: Container(
        width: 83,
        decoration: BoxDecoration(
          color: Colors.white,
          border: border,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(76),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              feeling.imagePath,
              width: 53,
              height: 50,
            ),
            Text(
              feeling.name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
