import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_icons.dart';

import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/home/home_screen/screen/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      body: MainScreen(),
      bottomNavigationBar: NavigationBar(
        height: 66,
        onDestinationSelected: (index) => 0,
        selectedIndex: 2,
        destinations: [
          NavigationDestination(
              selectedIcon: SvgPicture.asset(AppIcons.home1),
              icon: SvgPicture.asset(AppIcons.home2),
              label: ""),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(AppIcons.calendar),
              icon: SvgPicture.asset(AppIcons.calendar),
              label: ""),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AppIcons.profile2),
              icon: SvgPicture.asset(AppIcons.profile1), label: ""),
        ],
      ),
    );
  }
}
