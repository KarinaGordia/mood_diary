import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_diary/resources/images.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  void initState() {
    final model = context.read<EmotionsScreenViewModel>();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      model.updateTime();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EmotionsScreenViewModel>();
    final dateTitle = model.createTitle();
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Text(
              dateTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.appBarTimeTitle,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            ),
            onPressed: () {},
            icon: SvgPicture.asset(Images.calendarIcon),
          ),
        ],
      ),
    );
  }
}