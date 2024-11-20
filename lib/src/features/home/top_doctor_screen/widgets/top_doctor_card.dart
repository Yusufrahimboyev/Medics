import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/style/app_icons.dart';

class TopDoctorCard extends StatelessWidget {
  const TopDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.onPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colors.tertiary),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: DecoratedBox(
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
                  image: AssetImage(AppImages.man),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Marcus Horizon",
                  style: context.textTheme.titleLarge?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Chardiologist",
                  style: context.textTheme.titleSmall?.copyWith(
                      color: context.colors.onSecondary,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
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
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: SvgPicture.asset(
                            AppIcons.star,
                            height: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            "4,7",
                            style: context.textTheme.labelLarge?.copyWith(
                                color: context.colors.onPrimaryContainer,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.location,
                      height: 16,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "700m away",
                      style: context.textTheme.titleSmall?.copyWith(
                          color: context.colors.onSecondary,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
