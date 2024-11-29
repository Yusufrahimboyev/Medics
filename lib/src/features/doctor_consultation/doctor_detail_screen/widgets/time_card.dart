import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class TimeCard extends StatefulWidget {
  const TimeCard({super.key});

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
            Expanded(
              child: FilterChip(
                showCheckmark: false,
                selectedColor: context.colors.onPrimaryContainer,
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
                    "10:00 AM",
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: isSelected
                          ? context.colors.onPrimary
                          : context.colors.primary,
                    ),
                  ),
                ),
                onSelected: (_) {
                  isSelected = !isSelected;

                  setState(() {});
                },
                selected: isSelected,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
