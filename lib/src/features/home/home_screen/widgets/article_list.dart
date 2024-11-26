import 'package:flutter/material.dart';

import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class ArticleList extends StatelessWidget {
  final String image;
  final String title;
  final String readTime;
  final String datetime;

  const ArticleList(
      {super.key,
      required this.image,
      required this.title,
      required this.readTime,
      required this.datetime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.2,
                color: context.colors.tertiary,
              ),
              color: context.colors.onPrimary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colors.tertiary,
                      ),
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
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            title,
                            maxLines: 2,
                            style: context.textTheme.titleSmall?.copyWith(
                              overflow: TextOverflow.clip,
                              fontWeight: FontWeight.w600,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              datetime,
                              style: context.textTheme.labelMedium?.copyWith(
                                  color: context.colors.onSecondary,
                                  fontWeight: FontWeight.w500),
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: context.colors.onSecondary,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              readTime,
                              style: context.textTheme.labelLarge?.copyWith(
                                  color: context.colors.onPrimaryContainer,
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
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
