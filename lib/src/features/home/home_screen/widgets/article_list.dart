import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class ArticleList extends StatefulWidget {
  final String image;
  final String title;
  final String readTime;
  final String datetime;
  final bool isSaved;

  const ArticleList(
      {super.key,
      required this.image,
      required this.title,
      required this.readTime,
      required this.datetime,
      required this.isSaved});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.2,
              color: context.colors.tertiary,
            ),
            color: context.colors.onPrimary,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.colors.tertiary,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Image(
                      image: AssetImage(widget.image),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          widget.title,
                          maxLines: 2,
                          style: context.textTheme.titleSmall?.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.datetime,
                            style: context.textTheme.labelMedium?.copyWith(
                                color: context.colors.onSecondary,
                                fontWeight: FontWeight.w500),
                          ),
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: context.colors.onSecondary,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            widget.readTime,
                            style: context.textTheme.labelLarge?.copyWith(
                                color: context.colors.onPrimaryContainer,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  style: const ButtonStyle(
                    overlayColor: WidgetStateColor.transparent,
                  ),
                  onPressed: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                  },
                  icon: isSaved
                      ? SvgPicture.asset(
                          AppIcons.saved,
                          colorFilter: ColorFilter.mode(
                              context.colors.primary, BlendMode.srcATop),
                          width: 18,
                        )
                      : SvgPicture.asset(
                          AppIcons.notsaved,
                          colorFilter: ColorFilter.mode(
                              context.colors.primary, BlendMode.srcATop),
                          width: 18,
                        ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
