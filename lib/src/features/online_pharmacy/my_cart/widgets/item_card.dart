import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/style/app_icons.dart';

class ItemCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String capacity;

  const ItemCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.capacity});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: context.colors.tertiary,
          ),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      widget.imageUrl,
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.capacity,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colors.onSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          style: const ButtonStyle(
                              overlayColor: WidgetStateColor.transparent),
                          onPressed: () {
                            if (count > 0) {
                              count--;
                              setState(() {});
                            }
                          },
                          icon: SvgPicture.asset(
                            AppIcons.minus,
                          ),
                        ),
                        Text(
                          "$count",
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colors.primary,
                          ),
                        ),
                        IconButton(
                          style: const ButtonStyle(
                              overlayColor: WidgetStateColor.transparent),
                          onPressed: () {
                            count++;
                            setState(() {});
                          },
                          icon: SvgPicture.asset(
                            AppIcons.plus,
                            height: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppIcons.basket,
                    width: 20,
                  ),
                  Text(
                    "\$${widget.price}",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
