import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/style/app_icons.dart';

import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/router/app_router.dart';

class PopularProductList extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String count;
  final String price;

  const PopularProductList(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: context.colors.tertiary,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  Image.asset(
                    imageUrl,
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    count,
                    style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.onSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
                        style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          context.push(AppRouter.drugDetail);
                        },
                        child: SvgPicture.asset(AppIcons.plus),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
