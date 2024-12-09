import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class DateReason extends StatefulWidget {
  const DateReason({super.key});

  @override
  State<DateReason> createState() => _DateReasonState();
}

class _DateReasonState extends State<DateReason> {
  DateTime now = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  context.lang.date,
                  style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: context.colors.tertiary,
                  child: SvgPicture.asset(AppIcons.calendar3),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DateFormat('MMM dd, yyyy | hh:mm a').format(now),
                  style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.tertiaryFixed,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  context.lang.change,
                  style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.onSecondary,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            )
          ],
        ),
        Divider(
          color: context.colors.tertiary,
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  context.lang.reason,
                  style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: context.colors.tertiary,
                  child: SvgPicture.asset(AppIcons.calendar3),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  context.lang.chest_pain,
                  style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.tertiaryFixed,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  context.lang.change,
                  style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.onSecondary,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            )
          ],
        ),
        Divider(
          color: context.colors.tertiary,
        ),
      ],
    );
  }
}
