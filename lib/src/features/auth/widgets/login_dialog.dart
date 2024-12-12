import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../common/style/app_icons.dart';

class SuccessWidget extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const SuccessWidget({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: SvgPicture.asset(
              AppIcons.doneDialog,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            title,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              message,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: context.colors.onPrimaryFixedVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(220, 65),
              backgroundColor: context.colors.onPrimaryContainer,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 50,
              ),
              shape: const StadiumBorder(),
            ),
            child: Text(
              buttonText,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colors.onPrimary,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
