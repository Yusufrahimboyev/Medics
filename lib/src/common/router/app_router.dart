import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  static const String logout = "/logout";
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
GoRouter goRouter = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRouter.onboarding,
  routes: [],
);
