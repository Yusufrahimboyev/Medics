import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/auth/bloc/new_password/new_password_bloc.dart';
import 'package:medics/src/features/auth/bloc/reset_password/reset_pass_bloc.dart';
import 'package:medics/src/features/auth/bloc/sign_up/auth_bloc.dart';
import 'package:medics/src/features/auth/bloc/sign_up_verify/sign_up_verify_bloc.dart';
import 'package:medics/src/features/auth/screen/login_screen.dart';
import 'package:medics/src/features/auth/screen/new_password_screen.dart';
import 'package:medics/src/features/auth/screen/reset_password_screen.dart';
import 'package:medics/src/features/auth/screen/sign_up_screen.dart';
import 'package:medics/src/features/auth/screen/sign_up_verify_screen.dart';
import 'package:medics/src/features/splash/screens/onboarding_screen4.dart';
import '../../features/auth/bloc/log_in/log_in_bloc.dart';
import '../../features/auth/bloc/password_verify/password_verify_bloc.dart';
import '../../features/auth/screen/verify_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/splash/screens/onboarding_screen.dart';
import '../constants/constants.dart';

class AppRouter {
  const AppRouter._();

  //Muso
  static const String onboarding = "/onboarding";
  static const String onboarding2 = "/onboarding2";
  static const String signUp = "/signUp";
  static const String logIn = "/logIn";
  static const String resetEp = "/resetEp";
  static const String verify = "/verify";
  static const String signUpVerify = "/signUpVerify";
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
      redirect: (context, state) => (context.dependencies.sharedPreferences.getString(Constants.token) ?? '').isEmpty ? AppRouter.logIn : AppRouter.home,
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
      path: AppRouter.onboarding,
      name: AppRouter.onboarding,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:  const OnboardingScreen(), // Your screen
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
      path: AppRouter.onboarding2,
      name: AppRouter.onboarding2,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:  const OnboardingScreen4(), // Your screen
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
      path: AppRouter.logIn,
      name: AppRouter.logIn,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (BuildContext context) => LogInBloc(),
          child: const LoginScreen(),
        ),
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
      path: AppRouter.signUp,
      name: AppRouter.signUp,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (BuildContext context) => AuthBloc(),
          child: const SignUpScreen(),
        ),
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
      path: AppRouter.newPassword,
      name: AppRouter.newPassword,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:BlocProvider(
          create: (BuildContext context) => NewPasswordBloc(),
          child: const NewPasswordScreen(),
        ), // Your screen
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
      path: AppRouter.resetEp,
      name: AppRouter.resetEp,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (BuildContext context) => ResetPassBloc(),
          child: const ResetPasswordScreen(),
        ),
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
      path: AppRouter.verify,
      name: AppRouter.verify,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (BuildContext context) => PasswordVerifyBloc(),
          child: VerificationCodeScreen(email: state.extra as String),
        ),
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
      path: AppRouter.signUpVerify,
      name: AppRouter.signUpVerify,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (BuildContext context) => SignUpVerifyBloc(),
          child: SignUpVerifyScreen(email: state.extra as String),
        ),
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
