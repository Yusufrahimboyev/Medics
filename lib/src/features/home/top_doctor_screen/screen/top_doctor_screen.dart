import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/common/widgets/my_card.dart';

import '../../../../common/style/app_images.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        leading: const CupertinoNavigationBarBackButton(),
        title: Text(
          context.lang.Top_Doctor,
          style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.primary, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < 10; i++)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: MyCard(
                          title: "Dr. Marcus Horizon",
                          subtitle: "Chardiologist",
                          starPoint: "4,7",
                          distance: "5.7",
                          image: AppImages.man),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
