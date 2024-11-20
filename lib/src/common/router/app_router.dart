import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/features/home/top_doctor_screen/screen/top_doctor_screen.dart';

import '../../features/home/home_screen/screen/home_screen.dart';

class AppRouter {
  const AppRouter._();

  //Muso
  static const String onboarding = "/onboarding";
  static const String onboardingLast = "/onboardingLast";
  static const String signUp = "/signUp";
  static const String resetEp = "/resetEp";
  static const String verify = "/verify";
  static const String newPassword = "/newPassword";

  //Yusuf
  static const String home = "/home";
  static const String search = "/search";
  static const String topDoctor = "/topDoctor";
  static const String findDoctor = "/findDoctor";
  static const String doctorDetail = "/doctorDetail";
  static const String booking = "/booking";
  static const String schedule = "/schedule";
  static const String message = "/message";
  static const String articles = "/articles";
  static const String pharmacy = "/pharmacy";
  static const String drugDetail = "/drugDetail";
  static const String myCart = "/myCart";
  static const String ambulance = "/ambulance";

  //Abdumannon
  static const String profile = "/profile";
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRouter.home,
  routes: [
    GoRoute(
      path: AppRouter.home,
      name: AppRouter.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(), // Your screen
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.5, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    ),
    GoRoute(
      path: AppRouter.topDoctor,
      name: AppRouter.topDoctor,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const TopDoctorScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.5, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    ),
  ],
);
