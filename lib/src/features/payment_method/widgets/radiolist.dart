import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medics/src/common/utils/context_extension.dart';


class Radiolist extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final Function(int?)? onChanged;
  final dynamic image;
  final bool isIcon;

  const Radiolist({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.image,
    required this.isIcon,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      secondary: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: isIcon
            ? FaIcon(
          FontAwesomeIcons.apple,
          size: 35,
          color: context.colors.onPrimary,
        )
            : SvgPicture.asset(
          image,
          height: 35,
          width: 35,
        ),
      ),
      activeColor: context.colors.primary,
      tileColor: context.colors.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
