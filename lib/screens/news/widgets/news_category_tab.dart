import 'package:flutter/material.dart';
import 'package:news_event_management/constants/app_colors.dart';
import 'package:news_event_management/constants/text_styles.dart';
import 'package:news_event_management/screens/news/news_api_config.dart';

class NewsCategoryTab extends StatelessWidget {
  const NewsCategoryTab({
    Key? key,
    required this.size,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final Size size;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // height: 100,
      padding: EdgeInsets.only(left: size.width * 0.05),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyles.titleTextStyle.copyWith(
          color: AppColors.textColor,
          fontSize: 30,
        ),
        unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
        overlayColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.secondaryColor;
          }
          if (states.contains(MaterialState.focused)) {
            return AppColors.blueColor;
          } else if (states.contains(MaterialState.hovered)) {
            return AppColors.blueColor;
          }

          return Colors.transparent;
        }),
        indicatorWeight: size.width * 0.01,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          border: Border.all(color: AppColors.secondaryColor),
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryColor.withOpacity(0.8),
        ),
        isScrollable: true,
        physics: const BouncingScrollPhysics(),
        onTap: (int index) {
          //  print('Tab $index is tapped');
        },
        enableFeedback: true,
        controller: _tabController,
        tabs: Config.categories,
      ),
    );
  }
}
