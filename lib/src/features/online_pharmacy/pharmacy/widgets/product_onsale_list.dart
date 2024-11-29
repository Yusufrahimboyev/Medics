import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/style/app_icons.dart';

class ProductOnsaleList extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String capacity;
  final String price;
  final String discount;


  const ProductOnsaleList(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.capacity,
      required this.price,
      required this.discount,
     });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    capacity,
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
                      Text(
                        "\$$discount",
                        style: context.textTheme.labelSmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                context.colors.onSecondaryContainer,
                            decorationThickness: 1,
                            color: context.colors.onSecondary,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: (){
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
