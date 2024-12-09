import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/style/app_icons.dart';

class DrugsDetailScreen extends StatefulWidget {
  const DrugsDetailScreen({super.key});

  @override
  State<DrugsDetailScreen> createState() => _DrugsDetailScreenState();
}

class _DrugsDetailScreenState extends State<DrugsDetailScreen> {
  bool isSelected = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: SvgPicture.asset(AppIcons.socet),
          ),
        ],
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          context.lang.Drugs_Detail,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: const CupertinoNavigationBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Image.asset(
                  fit: BoxFit.contain,
                  AppImages.health,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OBH Combi",
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "75ml",
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colors.onSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          SvgPicture.asset(
                            AppIcons.star,
                            height: 14,
                          ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "4.0",
                          style: context.textTheme.bodyLarge?.copyWith(
                              color: context.colors.onPrimaryContainer,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        isSelected = !isSelected;
                        setState(() {});
                      },
                      icon: SvgPicture.asset(
                          isSelected ? AppIcons.heartSelected : AppIcons.heart),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      style: const ButtonStyle(
                          overlayColor: WidgetStateColor.transparent),
                      onPressed: () {
                        if (count > 0) {
                          count--;
                          setState(() {});
                        }
                      },
                      icon: SvgPicture.asset(
                        AppIcons.minus,
                      ),
                    ),
                    Text(
                      "$count",
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.primary,
                      ),
                    ),
                    IconButton(
                      style: const ButtonStyle(
                          overlayColor: WidgetStateColor.transparent),
                      onPressed: () {
                        count++;
                        setState(() {});
                      },
                      icon: SvgPicture.asset(
                        AppIcons.plus,
                        height: 22,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$9.99",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.lang.description,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing",
                        style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.colors.primary,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const TextSpan(text: " "),
                      TextSpan(
                        text: context.lang.read_more,
                        style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context.colors.onPrimaryContainer),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colors.tertiary,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      width: 24,
                      AppIcons.socet,
                      colorFilter: ColorFilter.mode(
                          context.colors.onPrimaryContainer, BlendMode.srcATop),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        context.colors.onPrimaryContainer),
                  ),
                  onPressed: () {
                    context.push(AppRouter.myCart);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(
                      context.lang.booking,
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: context.colors.onPrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
