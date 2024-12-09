import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';

import 'package:medics/src/common/utils/context_extension.dart';
import '../../../../common/style/app_icons.dart';

class RecommendedDoctors extends StatelessWidget {
  final String title;
  final String job;
  final String stars;
  final String distance;
  final String image;

  const RecommendedDoctors(
      {super.key,
      required this.title,
      required this.job,
      required this.stars,
      required this.distance,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () {
        context.push(AppRouter.doctorDetail);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.onPrimary,
          boxShadow: [
            BoxShadow(
              color: context.colors.onSecondary.withOpacity(0.1),
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
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(88),
                      ),
                      child: Image(
                        image: AssetImage(image),
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
                      title,
                      style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colors.primary),
                    ),
                    Text(
                      job,
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
                                    stars,
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
                          "$distance away",
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
    );
  }
}
