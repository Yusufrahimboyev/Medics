import 'package:flutter/material.dart';
import 'package:medics/src/common/style/app_images.dart';

import 'package:medics/src/common/utils/context_extension.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.tertiary,
        border: Border.all(
          width: 2,
          color: context.colors.tertiary,
        ),
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      maxLines: 2,
                      context.lang.Order_quickly,
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 15),
                  FilledButton(
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      ),
                      shape: const WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        )),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                          context.colors.onPrimaryContainer),
                    ),
                    onPressed: () {},
                    child: Text(
                      context.lang.upload_prescription,
                      style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colors.onPrimary),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Image.asset(
              AppImages.tabletka,
            ),)
          ],
        ),
      ),
    );
  }
}
