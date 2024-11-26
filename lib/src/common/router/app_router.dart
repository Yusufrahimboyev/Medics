import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/features/doctor_consultation/booking_screen/screen/booking_doctor_screen.dart';
import 'package:medics/src/features/doctor_consultation/doctor_detail_screen/screen/doctor_detail_screen.dart';
import 'package:medics/src/features/doctor_consultation/find_doctor_screen/screen/find_doctor_screen.dart';
import 'package:medics/src/features/doctor_consultation/schedule_screen/screen/schedule_screen.dart';
import 'package:medics/src/features/home/home_screen/screen/main_screen.dart';
import 'package:medics/src/features/home/top_doctor_screen/screen/top_doctor_screen.dart';
import 'package:medics/src/features/online_pharmacy/articles/screen/articles_screen.dart';
import 'package:medics/src/features/profil/screen/profile_screen.dart';

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
  static const String main = "/main";
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
  initialLocation: AppRouter.main,
  routes: [

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
    GoRoute(
      path: AppRouter.findDoctor,
      name: AppRouter.findDoctor,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const FindDoctorScreen(),
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
      path: AppRouter.doctorDetail,
      name: AppRouter.doctorDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const DoctorDetailScreen(),
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
      path: AppRouter.booking,
      name: AppRouter.booking,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const BookingDoctorScreen(),
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
      path: AppRouter.articles,
      name: AppRouter.articles,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const ArticlesScreen(),
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
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      parentNavigatorKey: navigationKey,
      routes: [
        GoRoute(
          path: AppRouter.main,
          name: AppRouter.main,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const MainScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          path: AppRouter.schedule,
          name: AppRouter.schedule,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const ScheduleScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          path: AppRouter.profile,
          name: AppRouter.profile,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const ProfileScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
    ),
  ],
);
