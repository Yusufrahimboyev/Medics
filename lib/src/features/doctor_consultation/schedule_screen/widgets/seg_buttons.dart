import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class SegButtons extends StatefulWidget {
  const SegButtons({super.key});

  @override
  State<SegButtons> createState() => _SegButtonsState();
}

class _SegButtonsState extends State<SegButtons> {
  String selected1 = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return  SegmentedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return context.colors.onPrimaryContainer;
            }
            return Colors.grey.shade200; // Default color
          },
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
      showSelectedIcon: false,
      segments: [
        ButtonSegment(
          value: "1",
          label: Text(
            context.lang.upcoming,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: selected1 == "1"
                  ? context.colors.onPrimary
                  : context.colors.primary,
            ),
          ),
        ),
        ButtonSegment(
          value: "2",
          label: Text(
            context.lang.completed,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: selected1 == "2"
                  ? context.colors.onPrimary
                  : context.colors.primary,
            ),
          ),
        ),
        ButtonSegment(
          value: "3",
          label: Text(
            context.lang.canceled,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: selected1 == "3"
                  ? context.colors.onPrimary
                  : context.colors.primary,
            ),
          ),
        )
      ],
      selected: <String>{selected1},
      onSelectionChanged: (Set<String> newSelection) {
        setState(
              () {
            selected1 = newSelection.first;
          },
        );
      },
    );
  }
}
