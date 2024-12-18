import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/features/doctor_consultation/booking_screen/screen/booking_doctor_screen.dart';
import 'package:medics/src/features/doctor_consultation/doctor_detail_screen/screen/doctor_detail_screen.dart';
import 'package:medics/src/features/doctor_consultation/find_doctor_screen/screen/find_doctor_screen.dart';
import 'package:medics/src/features/doctor_consultation/schedule_screen/screen/schedule_screen.dart';
import 'package:medics/src/features/home/main/screen/main_screen.dart';
import 'package:medics/src/features/home/top_doctor_screen/screen/top_doctor_screen.dart';
import 'package:medics/src/features/online_pharmacy/articles/screen/articles_screen.dart';
import 'package:medics/src/features/online_pharmacy/drugs_detail/screen/drugs_detail_screen.dart';
import 'package:medics/src/features/online_pharmacy/location/screen/ambulance_screen.dart';
import 'package:medics/src/features/online_pharmacy/my_cart/screen/my_cart_screen.dart';
import 'package:medics/src/features/online_pharmacy/pharmacy/screen/pharmacy_screen.dart';

import 'package:medics/src/features/payment_method/screen/payment_screen.dart';
import 'package:medics/src/features/payment_method/top_up/top_up_screen.dart';
import 'package:medics/src/features/payment_method/second_top_up/screen/top_up_second_screen.dart';
import 'package:medics/src/features/profil/screen/app_info/app_info.dart';
import 'package:medics/src/features/profil/screen/appointment_history/appointment_history_screen.dart';
import 'package:medics/src/features/profil/screen/change_language/change_language.dart';
import 'package:medics/src/features/profil/screen/edit_profile/edit_profile.dart';
import 'package:medics/src/features/profil/screen/faqs/faqs_screen.dart';
import 'package:medics/src/features/profil/screen/my_saved_screen/my_saved_screen.dart';
import 'package:medics/src/features/profil/screen/profile_screen/profile_screen.dart';
import '../../features/home/home_screen/screen/home_screen.dart';
import '../../features/payment_method/add_card/add_card_screen.dart';
import '../../features/payment_method/bloc/payment_bloc.dart';
import '../../features/payment_method/second_top_up/bloc/second_top_up_bloc.dart';
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
import '../../features/splash/screens/onboarding_screen.dart';

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
  static const String wallet = "/wallet";
  static const String topUp1 = "/topUp1";
  static const String topUp2 = "/topUp2";
  static const String editProfile = "/editProfile";
  static const String changeLang = "/changeLang";
  static const String appInfo = "/appInfo";
  static const String mySaved = "/mySaved";
  static const String faqs = "/faqs";
  static const String appointment = "/appointment";
  static const String addCart = "/addCart";

  //Abdumannon
  static const String profile = "/profile";
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRouter.onboarding,
  routes: [
    GoRoute(
      path: AppRouter.topDoctor,
      name: AppRouter.topDoctor,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const TopDoctorScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.topUp1,
      name: AppRouter.topUp1,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const TopUpScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.topUp2,
      name: AppRouter.topUp2,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
            create: (BuildContext context) => SecondTopUpBloc(),
            child: TopUpSecondScreen(topup: state.extra as int)),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.wallet,
      name: AppRouter.wallet,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
            create: (BuildContext context) => PaymentBloc(),
            child: const PaymentScreen()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.ambulance,
      name: AppRouter.ambulance,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AmbulanceScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
        child: DoctorDetailScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.pharmacy,
      name: AppRouter.pharmacy,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const PharmacyScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
        child: const OnboardingScreen(), // Your screen
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
        child: const OnboardingScreen4(), // Your screen
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
        child: BlocProvider(
          create: (BuildContext context) => NewPasswordBloc(),
          child: const NewPasswordScreen(),
        ), // Your screen
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.drugDetail,
      name: AppRouter.drugDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const DrugsDetailScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.myCart,
      name: AppRouter.myCart,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const MyCartScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
              const begin = Offset(1.0, 1.0);
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
              const begin = Offset(1.0, 1.0);
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
              const begin = Offset(1.0, 1.0);
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
    GoRoute(
      path: AppRouter.changeLang,
      name: AppRouter.changeLang,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const ChangeLanguage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.editProfile,
      name: AppRouter.editProfile,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const EditProfile(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.appInfo,
      name: AppRouter.appInfo,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AppInfo(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.mySaved,
      name: AppRouter.mySaved,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const MySavedScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.faqs,
      name: AppRouter.faqs,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const FaqsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.appointment,
      name: AppRouter.appointment,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AppointmentHistoryScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
      path: AppRouter.addCart,
      name: AppRouter.addCart,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const AddCardScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
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
