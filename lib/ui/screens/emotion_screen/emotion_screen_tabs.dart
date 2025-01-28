import 'package:flutter/material.dart';
import 'package:mood_diary/resources/app_icons.dart';
import 'package:mood_diary/ui/theme/app_colors.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                Center(
                  child: Text(
                    'Здесь будет отображаться ваш дневник настроения',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Center(
                  child: Text(
                    'Здесь будет отображаться ваша статистика',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
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
