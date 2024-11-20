import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/home/top_doctor_screen/widgets/top_doctor_card.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        leading: const BackButton(),
        title: Text(
          context.lang.Top_Doctor,
          style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.primary, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(AppIcons.menyu),
          )
        ],
      ),
    body: ListView(
      children: [
        for(int i=0;i<10;i++)
        TopDoctorCard(),

      ],
    ),
    );
  }
}
