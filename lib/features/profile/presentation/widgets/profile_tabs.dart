import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/features/profile/presentation/widgets/tab_item.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {

    return TabBar(
      indicatorWeight: 2,
      indicatorColor: ColorsManager.yellow,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: ColorsManager.yellow,
      unselectedLabelColor: Colors.white,
      tabs: [

        TabItem(
          icon: Image.asset(
            AssetsManager.watchListIcon,
          ),
          label: "Watch List",
        ),

        TabItem(
          icon: Image.asset(
            AssetsManager.historyIcon,
          ),
          label: "History",
        ),
      ],
    );
  }
}