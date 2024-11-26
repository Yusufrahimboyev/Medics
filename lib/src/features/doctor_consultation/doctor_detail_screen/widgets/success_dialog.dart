import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colors.onPrimary,
      title: Column(
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
            style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.primary, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            context.lang.payment_successful,
            style: context.textTheme.titleSmall?.copyWith(
                color: context.colors.primary, fontWeight: FontWeight.w400),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
              context.go(AppRouter.schedule);
            },
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(context.colors.onPrimaryContainer),
            ),
            child: Text(
              context.lang.view_schedule,
            ),
          ),
        ],
      ),
    );
  }
}
