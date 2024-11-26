import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class MyStack extends StatelessWidget {
  final String text;
  final void Function() function;
  final String icons;

  const MyStack(
      {super.key,
      required this.function,
      required this.text,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          overlayColor: WidgetStateColor.transparent,
          onTap: function,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: context.colors.onPrimary,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: context.colors.onSecondary.withOpacity(0.4),
                  offset: const Offset(12, 12),
                  blurRadius: 30,
                ),
              ],
            ),
            child: SizedBox(
              height: 54,
              width: 54,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  icons,
                ),
              ),
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onPrimaryFixedVariant,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
