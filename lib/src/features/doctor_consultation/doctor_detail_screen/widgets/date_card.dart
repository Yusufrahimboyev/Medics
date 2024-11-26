import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class DateCard extends StatelessWidget {
  const DateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) => SizedBox(
              width: 46,
              height: 64,
              child: FilterChip(
                labelPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                side: BorderSide(
                  color: context.colors.tertiary,
                  width: 1,
                ),
                backgroundColor: context.colors.onPrimary,
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Wed",
                      style: context.textTheme.labelMedium?.copyWith(
                          color: context.colors.onPrimaryFixedVariant),
                    ),
                    Text(
                      "10",
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: context.colors.primary),
                    ),
                  ],
                ),
                onSelected: (_) {},
              ),
            ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              width: 10,
            ),
        itemCount: 30);
  }
}
