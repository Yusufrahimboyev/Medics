import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../common/style/app_icons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "image": AppIcons.doctor1,
      "text": "Consult only with a doctor you trust",
    },
    {
      "image": AppIcons.doctor2,
      "text": "Find a lot of specialist doctors in one place",
    },
    {
      "image": AppIcons.doctor3,
      "text": "Get connect our Online Consultation",
    },
  ];

  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRouter.onboarding2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Center(
                    child: Image.asset(
                      _pages[index]["image"],
                      height: 500,
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 60,
            right: 16,
            child: TextButton(
              onPressed: () {
                context.go(AppRouter.onboarding2);
              },
              child: Text(
                context.lang.skip,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colors.secondaryContainer,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.65,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 226,
                  width: 355,
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
                          _pages[_currentPage]["text"],
                          textAlign: TextAlign.start,
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: List.generate(
                                _pages.length,
                                    (dotIndex) => Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  height: 5,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: dotIndex == _currentPage
                                        ? context.colors.onPrimaryContainer
                                        : context.colors.onPrimaryContainer.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 170,
                          ),
                          ElevatedButton(
                            onPressed: _onNextPressed,
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(17),
                              backgroundColor: context.colors.onPrimaryContainer,
                            ),
                            child: SvgPicture.asset(AppIcons.arrowRight),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
