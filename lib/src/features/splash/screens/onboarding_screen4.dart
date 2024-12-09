import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../common/router/app_router.dart';
import '../../../common/style/app_icons.dart';

class OnboardingScreen4 extends StatefulWidget {
  const OnboardingScreen4({super.key});

  @override
  State<OnboardingScreen4> createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.medics,
            height: 70,
          ),
          Text(
            context.lang.Medics,
            style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.onPrimaryContainer),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            context.lang.Let_started,
            style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colors.primary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              context.lang.login_enjoy,
              style: context.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: context.colors.secondaryFixed),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              context.push(AppRouter.logIn);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.onPrimaryContainer,
              padding: const EdgeInsets.symmetric(
                  horizontal: 110, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(context.lang.Login,
                style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colors.onPrimary)),
          ),
          const SizedBox(height: 15),
          // Sign Up Button
          OutlinedButton(
            onPressed: () {
              context.push(AppRouter.signUp);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 100, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: BorderSide(
                color: context.colors.onPrimaryContainer,
                width: 1,
              ),
            ),
            child: Text(
              context.lang.Sign_Up,
              style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colors.onPrimaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}
