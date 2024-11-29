import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';

import 'package:medics/src/common/utils/context_extension.dart';

class HomeMainCard extends StatelessWidget {
  final String buttonTitle;
  final String title;
  final String imageUrl;

  const HomeMainCard(
      {super.key,
      required this.buttonTitle,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: context.colors.tertiary,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 18),
                    child: Text(
                      title,
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            context.colors.onPrimaryContainer),
                      ),
                      onPressed: () {
                        context.push(AppRouter.topDoctor);
                      },
                      child: Text(buttonTitle),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: context.colors.onPrimary,
                        radius: 65,
                        child: CircleAvatar(
                          backgroundColor: context.colors.tertiary,
                          radius: 45,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        child: Image(
                          image: AssetImage(imageUrl),
                        ),
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
