import 'package:flutter/material.dart';
import 'package:mood_diary/domain/entity/feeling.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class FeelingsSection extends StatelessWidget {
  const FeelingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final feelings = context.read<EmotionsScreenViewModel>().feelings;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Что чувствуешь?',
          style: AppTextStyles.sectionTitle,
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
        const SubFeelingsSectionWidget(),
      ],
    );
  }
}

class FeelingButtonWidget extends StatelessWidget {
  const FeelingButtonWidget({super.key, required this.feeling});

  final Feeling feeling;

  @override
  Widget build(BuildContext context) {
    final model = context.read<EmotionsScreenViewModel>();
    final isSelected = context
        .select((EmotionsScreenViewModel model) => model.selectedFeelings)
        .contains(feeling);
    final border =
    isSelected ? Border.all(color: AppColors.mandarin, width: 2) : null;

    return InkWell(
      onTap: () {
        model.selectFeeling(feeling);
        model.getSubFeelingList();
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
              style: AppTextStyles.basic,
            ),
          ],
        ),
      ),
    );
  }
}

class SubFeelingsSectionWidget extends StatelessWidget {
  const SubFeelingsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final subFeelings =
    context.select((EmotionsScreenViewModel model) => model.subFeelings);
    return Container(
      padding: subFeelings.isNotEmpty
          ? const EdgeInsets.only(top: 15, right: 20)
          : null,
      child: Wrap(
        runAlignment: WrapAlignment.start,
        runSpacing: -4,
        spacing: 8,
        children: subFeelings.map((String subFeeling) {
          return SubFeelingWidget(
            subFeeling: subFeeling,
          );
        }).toList(),
      ),
    );
  }
}

class SubFeelingWidget extends StatelessWidget {
  const SubFeelingWidget({super.key, required this.subFeeling});

  final String subFeeling;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context
        .select((EmotionsScreenViewModel model) => model.selectedSubFeelings)
        .contains(subFeeling);
    final selectSubFeeling =
        context.read<EmotionsScreenViewModel>().selectSubFeeling;
    return FilterChip(
      visualDensity: const VisualDensity(
        vertical: -2,
      ),
      label: Text(subFeeling),
      labelStyle: Theme.of(context)
          .chipTheme
          .labelStyle
          ?.copyWith(color: isSelected ? AppColors.white : AppColors.black),
      selected: isSelected,
      onSelected: (bool value) => selectSubFeeling(subFeeling, isSelected),
    );
  }
}