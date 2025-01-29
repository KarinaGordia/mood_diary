import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:mood_diary/ui/widgets/custom_slider/custom_thumb_shape.dart';
import 'package:mood_diary/ui/widgets/custom_slider/custom_track_shape.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    super.key,
    required this.title,
    required this.minValueName,
    required this.maxValueName,
    required this.currentValue,
    this.onChanged,
  });

  final String title;
  final String minValueName;
  final String maxValueName;
  final double currentValue;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    final valueTextStyle = TextStyle(
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: AppColors.grey3,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(title, style: AppTextStyles.sectionTitle),
        Container(
          height: 77,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10,
                offset: Offset(2, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(13),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Container(
                      width: 2,
                      height: 8,
                      color: AppColors.grey5,
                    );
                  }),
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: CustomTrackShape(),
                  overlayShape: SliderComponentShape.noOverlay,
                  trackHeight: 6,
                  thumbShape:
                      const CircleThumbShape(thumbRadius: 9, borderWidth: 4),
                  thumbColor: AppColors.mandarin,
                  disabledThumbColor: AppColors.grey5,
                ),
                child: Slider(
                  value: currentValue,
                  activeColor: AppColors.mandarin,
                  inactiveColor: AppColors.grey5,
                  max: 1,
                  allowedInteraction: SliderInteraction.tapAndSlide,
                  onChanged: onChanged,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      minValueName,
                      style: valueTextStyle,
                    ),
                    Text(
                      maxValueName,
                      style: valueTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
