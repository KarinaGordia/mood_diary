import 'package:flutter/material.dart';
import 'package:mood_diary/resources/app_icons.dart';
import 'package:mood_diary/ui/screens/calendar_screen/calendar_screen_view_model.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class CalendarScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
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
          Navigator.of(context).popUntil((route) => route.isFirst);
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
    final showMonthlyCalendar = context.read<CalendarScreenViewModel>().showMonthlyCalendar;
    final isMonthlyCalendar =
        context.read<CalendarScreenViewModel>().isMonthlyCalendarMode;
    final model = context.read<CalendarScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: () {
          if (isMonthlyCalendar) {
            double offset = model.calculateOffsetToCurrentMonth();
            model.monthlyCalendarController.animateTo(
              offset,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            model.selectDay(CalendarFunctions.todayFormatted);
          } else {
            showMonthlyCalendar(context);
          }
        },
        child: Text(
          'Сегодня',
          textAlign: TextAlign.center,
          style: AppTextStyles.todayButton,
        ),
      ),
    );
  }
}
