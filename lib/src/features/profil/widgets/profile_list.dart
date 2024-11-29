import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class ProfileList extends StatelessWidget {
  final String icon;
  final String title;
  final Function() function;

  const ProfileList(
      {super.key,
      required this.icon,
      required this.title,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: function,
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: context.colors.tertiary,
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.primary, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            SvgPicture.asset(AppIcons.arrowRight),
          ],
        ),
      ),
    );
  }
}
