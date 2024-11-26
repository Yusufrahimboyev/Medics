import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../style/app_icons.dart';



class MyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String starPoint;
  final String distance;
  final String image;

  const MyCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.starPoint,
      required this.distance, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.zero,
      color: context.colors.onPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colors.tertiary),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.primary),
                  ),
                  Text(
                    subtitle,
                    style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.onSecondary),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: context.colors.tertiary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: SizedBox(
                      height: 26,
                      width: 46,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 2),
                            child: SvgPicture.asset(
                              AppIcons.star,
                              height: 12,
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              starPoint,
                              style: context.textTheme.labelLarge
                                  ?.copyWith(
                                  color: context
                                      .colors.onPrimaryContainer,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.location,
                        height: 16,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "${distance} m away",
                        style: context.textTheme.titleSmall?.copyWith(
                            color: context.colors.onSecondary,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
