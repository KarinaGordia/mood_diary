import 'package:flutter/material.dart';
import 'package:mood_diary/resources/app_icons.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';

class CalendarScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalendarScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 52,
      leading: IconButton(
        style: const ButtonStyle(
          iconColor: WidgetStatePropertyAll(AppColors.grey2),
        ),
        onPressed: () {
          Navigator.of(context).pop(context);
        },
        icon: const Icon(AppIcons.union, size: 16),
      ),
      actions: const [
        AppBarTodayButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarTodayButton extends StatelessWidget {
  const AppBarTodayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Сегодня',
          textAlign: TextAlign.center,
          style: AppTextStyles.today,
        ),
      ),
    );
  }
}
