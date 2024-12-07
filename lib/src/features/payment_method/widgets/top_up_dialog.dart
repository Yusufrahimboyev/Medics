import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../common/style/app_icons.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({super.key, required this.topup});

  final int topup;

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
                "${context.lang.you_have_successfully}$topup ",
                style: context.textTheme.titleSmall?.copyWith(
                    color: context.colors.onSecondary,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                context.pop();
                context.go(AppRouter.wallet);
              },
              style: ButtonStyle(
                minimumSize: const WidgetStatePropertyAll(
                  Size(160, 56),
                ),
                backgroundColor:
                    WidgetStatePropertyAll(context.colors.onPrimaryContainer),
              ),
              child: Text(
                "Text",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
