import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class MyFiltrchip extends StatefulWidget {
  final bool selected;
  final String time;
  final Function(bool) onTap;

  const MyFiltrchip({super.key, required this.selected, required this.time, required this.onTap});

  @override
  State<MyFiltrchip> createState() => _MyFiltrchipState();
}



class _MyFiltrchipState extends State<MyFiltrchip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      selectedColor: context.colors.onPrimaryContainer,
      disabledColor: context.colors.primary,
      backgroundColor: context.colors.onPrimary,
      side: BorderSide(

        width: 1,
        color: context.colors.tertiary,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Text(
          widget.time,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodySmall?.copyWith(
            color:
                widget.selected ? context.colors.onPrimary : context.colors.primary,
          ),
        ),
      ),
      onSelected: widget.onTap,
      selected:  widget.selected ,

    );
  }
}
