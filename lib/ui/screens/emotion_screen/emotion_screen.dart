import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_diary/resources/images.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';

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
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Text(
              '27 января 18:00',
              textAlign: TextAlign.center,
              style: AppTextStyles.appBarTimeTitle,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            iconSize: 24,
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(EdgeInsets.zero),
              fixedSize: WidgetStateProperty.all(const Size(24, 24)),
            ),
            onPressed: () {},
            icon: SvgPicture.asset(Images.calendarIcon),
          ),
        ],
      ),
    );
  }
}