import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/style/app_images.dart';

class ScheduleCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String time;
  final String image;

  const ScheduleCards({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.2,
          color: context.colors.tertiary,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: context.colors.onPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colors.primary),
                    ),
                    Text(
                      subtitle,
                      style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.colors.onSecondary),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(88),
                    ),
                    child: Image(
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.calendar1,
                  colorFilter: ColorFilter.mode(
                      context.colors.tertiaryFixed, BlendMode.srcATop),
                  height: 16,
                ),
                SizedBox(width: 6),
                Text(
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.tertiaryFixed,
                    ),
                    date),
                SizedBox(width: 6),
                SvgPicture.asset(
                  AppIcons.oclock,
                  colorFilter: ColorFilter.mode(
                      context.colors.tertiaryFixed, BlendMode.srcATop),
                  height: 16,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.tertiaryFixed,
                    ),
                    time),
                SizedBox(
                  width: 6,
                ),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: context.colors.onTertiaryFixed,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  context.lang.confirmed,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.tertiaryFixed,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(context.colors.tertiary),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      context.lang.cancel,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colors.tertiaryFixed,
                      ),
                    ),
                  ),
                ),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        context.colors.onPrimaryContainer),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    context.lang.reschedule,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
