import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import '../../../common/style/app_icons.dart';

class LogOutDialog extends StatelessWidget {
  final Function() func;

  const LogOutDialog({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colors.onPrimary,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              child: SvgPicture.asset(AppIcons.log),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                context.lang.are_you_sure,
                style: context.textTheme.titleLarge?.copyWith(
                    color: context.colors.primary, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextButton(
                onPressed: func,
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(context.colors.onPrimaryContainer),
                ),
                child: Text(
                  context.lang.logout,
                  style: context.textTheme.titleLarge?.copyWith(
                      color: context.colors.onPrimary,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  context.lang.cancel,
                  style: context.textTheme.titleLarge?.copyWith(
                      color: context.colors.onPrimaryContainer,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
