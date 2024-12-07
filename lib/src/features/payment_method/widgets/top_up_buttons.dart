import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class TopUpButtons extends StatelessWidget {
  final int title;
  final void Function(String text) onpress;

  const TopUpButtons({
    super.key,
    required this.title,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText = "\$ ${NumberFormat("#,###").format(
      (title),
    )}";
    return OutlinedButton(
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
      onPressed: () => onpress(buttonText),
      child: Text(
        buttonText,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
