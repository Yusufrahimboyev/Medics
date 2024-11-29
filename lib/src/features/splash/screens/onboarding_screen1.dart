import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../common/style/app_icons.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.go(AppRouter.onboarding4);
                      },
                      child: Text(
                        context.lang.skip,
                        style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.colors.secondaryContainer),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      AppIcons.doctor1,
                      height: 500,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 500),
                      child: Container(
                        height: 216,
                        width: 360,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFF5F7FF), // #F5F7FF
                              Color(0x00F5F7FF), // #F5F7FF00
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                context.lang.Consult_only,
                                textAlign: TextAlign.start,
                                style: context.textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.colors.primary),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          color: context.colors.onPrimaryContainer,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 5,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          color: context.colors.onPrimaryContainer.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 5,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          color: context.colors.onPrimaryContainer.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 180),
                                ElevatedButton(
                                  onPressed: () {
                                    context.go(AppRouter.onboarding2);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(15),
                                    backgroundColor: context.colors.onPrimaryContainer,
                                  ),
                                  child: SvgPicture.asset(AppIcons.arrowRight)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
