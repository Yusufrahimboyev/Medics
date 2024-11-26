import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/doctor_consultation/schedule_screen/widgets/schedule_cards.dart';
import 'package:medics/src/features/doctor_consultation/schedule_screen/widgets/seg_buttons.dart';

import '../../../../common/style/app_icons.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      context.lang.schedule,
                      style: context.textTheme.headlineSmall?.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AppIcons.notification,
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                          context.colors.primary, BlendMode.srcATop),
                    ),
                  ],
                ),
              ),
              const SegButtons(),
              const SizedBox(height: 6),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      const ScheduleCards(
                    title: 'Dr. Marcus Horizon',
                    subtitle: 'Chardiologist',
                    date: '26/06/2022',
                    time: '10:30 AM',
                    image: AppImages.man,
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 12),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
