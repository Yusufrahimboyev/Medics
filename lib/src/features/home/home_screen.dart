import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.onPrimary,
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(context.lang.Find_desire_healt),
                  SvgPicture.asset(AppIcons.notification,colorFilter: ColorFilter.mode(context.colors.surfaceTint, BlendMode.srcATop),width: 50,height: 50,),
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}
