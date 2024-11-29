import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/style/app_icons.dart';

import 'package:medics/src/common/utils/context_extension.dart';

import 'package:medics/src/features/home/screen/home_main_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            context.lang.Find_desire_healt,
                            style: context.textTheme.headlineSmall?.copyWith(
                                color: context.colors.primary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AppIcons.notification,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                              context.colors.primary, BlendMode.srcATop),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 22),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colors.onPrimaryFixed,
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: context.lang.Search_doctor_drugs,
                            hintStyle: context.textTheme.bodyLarge?.copyWith(
                              color: context.colors.onPrimaryFixedVariant,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                AppIcons.search,
                                colorFilter: ColorFilter.mode(
                                    context.colors.onSecondary,
                                    BlendMode.srcATop),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          cursorWidth: 2,
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.none,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.1),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: const SizedBox(height: 70, width: 70),
                          ),
                          Text(
                            context.lang.Doctor,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.1),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: const SizedBox(height: 70, width: 70),
                          ),
                          Text(
                            context.lang.pharmacy,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.1),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: const SizedBox(height: 70, width: 70),
                          ),
                          Text(
                            context.lang.Hospital,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.1),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: const SizedBox(height: 70, width: 70),
                          ),
                          Text(
                            context.lang.Ambulance,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
           const HomeMainCard(),
          ],
        ),
      ),
    );
  }
}
