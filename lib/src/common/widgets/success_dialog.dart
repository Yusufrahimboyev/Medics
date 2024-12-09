import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String route;

  const SuccessDialog({super.key, required this.route, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colors.onPrimary,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: SvgPicture.asset(AppIcons.doneDialog),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              context.lang.payment_success,
              style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.primary, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                maxLines: 3,
                textAlign: TextAlign.center,
                context.lang.payment_successful,
                style: context.textTheme.titleSmall?.copyWith(
                    color: context.colors.onSecondary,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                context.pop();
                context.go(route);
              },
              style: ButtonStyle(
                minimumSize: const WidgetStatePropertyAll(
                  Size(160, 56),
                ),
                backgroundColor:
                    WidgetStatePropertyAll(context.colors.onPrimaryContainer),
              ),
              child: Text(
                title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
