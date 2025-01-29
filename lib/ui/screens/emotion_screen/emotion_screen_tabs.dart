import 'package:flutter/material.dart';
import 'package:mood_diary/resources/app_icons.dart';
import 'package:mood_diary/ui/screens/emotion_screen/mood_diary_tab/mood_diary_tab.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';
import 'package:mood_diary/ui/theme/app_text_styles.dart';

class EmotionScreenTabs extends StatefulWidget {
  const EmotionScreenTabs({super.key});

  @override
  State<EmotionScreenTabs> createState() => _EmotionScreenTabsState();
}

class _EmotionScreenTabsState extends State<EmotionScreenTabs>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 30,
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(47.0),
                color: AppColors.grey4,
              ),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                isScrollable: true,
                tabs: const [
                  _TabWidget(
                    label: 'Дневник настроения',
                    icon: AppIcons.diary,
                  ),
                  _TabWidget(
                    label: 'Статистика',
                    icon: AppIcons.statistic,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  MoodDiaryTab(),
                  Center(
                    child: Text(
                      'Здесь будет отображаться ваша статистика',
                      style: AppTextStyles.sectionTitle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabWidget extends StatelessWidget {
  const _TabWidget({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 12),
          const SizedBox(
            width: 6,
          ),
          Text(label),
        ],
      ),
    );
  }
}
