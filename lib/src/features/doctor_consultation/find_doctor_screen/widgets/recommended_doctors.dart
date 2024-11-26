import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';

import 'package:medics/src/common/utils/context_extension.dart';
import '../../../../common/style/app_icons.dart';
import '../../../../common/style/app_images.dart';

class RecommendedDoctors extends StatelessWidget {
  const RecommendedDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          splashColor: WidgetStateColor.transparent,
          onTap: () {
            context.push(AppRouter.doctorDetail);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.onPrimary,
              boxShadow: [
                BoxShadow(
                  color: context.colors.onSecondary.withOpacity(0.4),
                  offset: const Offset(0, 1),
                  blurRadius: 30,
                )
              ],
              border: Border.all(
                width: 1,
                color: context.colors.tertiary,
              ),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(88),
                          ),
                          child: Image(
                            image: AssetImage(AppImages.man),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Marcus Horizon",
                          style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colors.primary),
                        ),
                        Text(
                          "Chardiologist",
                          style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colors.onSecondary),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 28),
                          child: Divider(
                            color: context.colors.tertiary,
                          ),
                        ),
                        Row(
                          children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: SvgPicture.asset(
                                        AppIcons.star,
                                        height: 12,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Text(
                                        "4,7",
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
                              width: 12,
                            ),
                            SvgPicture.asset(
                              AppIcons.location,
                              height: 16,
                            ),
                            const SizedBox(
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
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        Text(
          context.lang.recent_doctors,
          style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600, color: context.colors.primary),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(88),
                        ),
                        child: Image(
                          image: AssetImage(AppImages.man),
                        ),
                      ),
                    ),
                    Text(
                      "Dr. Marcus",
                      style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colors.primary),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(88),
                        ),
                        child: Image(
                          image: AssetImage(AppImages.man),
                        ),
                      ),
                    ),
                    Text(
                      "Dr. Marcus",
                      style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colors.primary),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(88),
                        ),
                        child: Image(
                          image: AssetImage(AppImages.man),
                        ),
                      ),
                    ),
                    Text(
                      "Dr. Marcus",
                      style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colors.primary),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(88),
                        ),
                        child: Image(
                          image: AssetImage(AppImages.man),
                        ),
                      ),
                    ),
                    Text(
                      "Dr. Marcus",
                      style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
