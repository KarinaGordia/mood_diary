import 'package:flutter/material.dart';
import 'package:mood_diary/ui/screens/emotion_screen/emotion_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<EmotionsScreenViewModel>();


    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text('Заметки', style: AppTextStyles.sectionTitle),
          Container(
            height: 90,
            padding: const EdgeInsets.all(10),
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
            child: TextField(
              controller: model.textFieldController,
              minLines: null,
              maxLines: null,
              expands: true,
              style: AppTextStyles.contentTextStyle,
              cursorColor: AppColors.black,
              decoration: InputDecoration.collapsed(
                  hintText: 'Введите заметку',
                  hintStyle: AppTextStyles.hintTextStyle),
              autofocus: false,
              onChanged: model.takeNote,
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}
