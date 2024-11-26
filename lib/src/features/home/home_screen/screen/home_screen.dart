import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.child});

  final Widget child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomInt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        overlayColor: WidgetStateColor.transparent,
        indicatorColor: Colors.transparent,
        height: 66,
        onDestinationSelected: (index) {
          bottomInt = index;
          setState(() {});
          switch (bottomInt) {
            case 0:
              context.go(AppRouter.main);
            case 1:
              context.go(AppRouter.schedule);
            default:
              context.go(AppRouter.profile);
          }
        },
        selectedIndex: bottomInt,
        destinations: [
          NavigationDestination(
              selectedIcon: SvgPicture.asset(AppIcons.home1),
              icon: SvgPicture.asset(AppIcons.home2),
              label: ""),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(AppIcons.calendar2),
              icon: SvgPicture.asset(AppIcons.calendar1),
              label: ""),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(AppIcons.profile2),
              icon: SvgPicture.asset(AppIcons.profile1),
              label: ""),
        ],
      ),
    );
  }
}
