import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class TrendingArticlesList extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String readTime;
  final String image;

  const TrendingArticlesList(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.readTime,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: Card(
        margin: EdgeInsets.zero,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          side: BorderSide(
            color: context.colors.tertiary,
          ),
        ),
        color: context.colors.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: Image(
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1),
                          child: Text(
                            title,
                            style: context.textTheme.labelMedium?.copyWith(
                                color: context.colors.onPrimaryContainer,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Text(
                    subtitle,
                    style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                    maxLines: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        date,
                        style: context.textTheme.labelSmall?.copyWith(
                            color: context.colors.onSecondary,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 2),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: context.colors.onSecondary,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        readTime,
                        style: context.textTheme.labelSmall?.copyWith(
                            color: context.colors.onPrimaryContainer,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
