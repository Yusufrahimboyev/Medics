// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Consult only with a doctor you trust`
  String get Consult_only {
    return Intl.message(
      'Consult only with a doctor you trust',
      name: 'Consult_only',
      desc: '',
      args: [],
    );
  }

  /// `Find a lot of specialist doctors in one place`
  String get find_specialist {
    return Intl.message(
      'Find a lot of specialist doctors in one place',
      name: 'find_specialist',
      desc: '',
      args: [],
    );
  }

  /// `Get connect our Online Consultation`
  String get Get_connect {
    return Intl.message(
      'Get connect our Online Consultation',
      name: 'Get_connect',
      desc: '',
      args: [],
    );
  }

  /// `Let’s get started!`
  String get Let_started {
    return Intl.message(
      'Let’s get started!',
      name: 'Let_started',
      desc: '',
      args: [],
    );
  }

  /// `Medics`
  String get Medics {
    return Intl.message(
      'Medics',
      name: 'Medics',
      desc: '',
      args: [],
    );
  }

  /// `Login to enjoy the features we’ve provided, and stay healthy!`
  String get login_enjoy {
    return Intl.message(
      'Login to enjoy the features we’ve provided, and stay healthy!',
      name: 'login_enjoy',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_Up {
    return Intl.message(
      'Sign Up',
      name: 'Sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? Sign Up`
  String get Dont_account {
    return Intl.message(
      'Don’t have an account? Sign Up',
      name: 'Dont_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get Sign_Google {
    return Intl.message(
      'Sign in with Google',
      name: 'Sign_Google',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get Sign_Apple {
    return Intl.message(
      'Sign in with Apple',
      name: 'Sign_Apple',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get Sign_Facebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'Sign_Facebook',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get Enter_email {
    return Intl.message(
      'Enter your email',
      name: 'Enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enter_password {
    return Intl.message(
      'Enter your password',
      name: 'Enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get Enter_name {
    return Intl.message(
      'Enter your name',
      name: 'Enter_name',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the medidoc Terms of Service and Privacy Policy`
  String get I_agree_medidoc_Policy {
    return Intl.message(
      'I agree to the medidoc Terms of Service and Privacy Policy',
      name: 'I_agree_medidoc_Policy',
      desc: '',
      args: [],
    );
  }

  /// `*The password you entered is wrong`
  String get wrong_password {
    return Intl.message(
      '*The password you entered is wrong',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get Forgot_Password {
    return Intl.message(
      'Forgot Password?',
      name: 'Forgot_Password',
      desc: '',
      args: [],
    );
  }

  /// `Yeay! Welcome Back`
  String get Welcome_Back {
    return Intl.message(
      'Yeay! Welcome Back',
      name: 'Welcome_Back',
      desc: '',
      args: [],
    );
  }

  /// `Once again you login successfully into medidoc app`
  String get Once_again {
    return Intl.message(
      'Once again you login successfully into medidoc app',
      name: 'Once_again',
      desc: '',
      args: [],
    );
  }

  /// `Go to home`
  String get go_home {
    return Intl.message(
      'Go to home',
      name: 'go_home',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email or your phone number, we will send you confirmation code`
  String get you_confirmation {
    return Intl.message(
      'Enter your email or your phone number, we will send you confirmation code',
      name: 'you_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get Reset_Password {
    return Intl.message(
      'Reset Password',
      name: 'Reset_Password',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get Verify {
    return Intl.message(
      'Verify',
      name: 'Verify',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive the code? Resend`
  String get receive_code {
    return Intl.message(
      'Didn’t receive the code? Resend',
      name: 'receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get Create_new_Password {
    return Intl.message(
      'Create New Password',
      name: 'Create_new_Password',
      desc: '',
      args: [],
    );
  }

  /// `Create your new password to login`
  String get Create_new_password {
    return Intl.message(
      'Create your new password to login',
      name: 'Create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get Confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'Confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Create Password`
  String get Create_Password {
    return Intl.message(
      'Create Password',
      name: 'Create_Password',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message(
      'Success',
      name: 'Success',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully reset your password.`
  String get You_successfully_reset {
    return Intl.message(
      'You have successfully reset your password.',
      name: 'You_successfully_reset',
      desc: '',
      args: [],
    );
  }

  /// `Find your desire healt solution`
  String get Find_desire_healt {
    return Intl.message(
      'Find your desire healt solution',
      name: 'Find_desire_healt',
      desc: '',
      args: [],
    );
  }

  /// `Search doctor, drugs, articles...`
  String get Search_doctor_drugs {
    return Intl.message(
      'Search doctor, drugs, articles...',
      name: 'Search_doctor_drugs',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get Doctor {
    return Intl.message(
      'Doctor',
      name: 'Doctor',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy`
  String get Pharmacy {
    return Intl.message(
      'Pharmacy',
      name: 'Pharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Hospital`
  String get Hospital {
    return Intl.message(
      'Hospital',
      name: 'Hospital',
      desc: '',
      args: [],
    );
  }

  /// `Ambulance`
  String get Ambulance {
    return Intl.message(
      'Ambulance',
      name: 'Ambulance',
      desc: '',
      args: [],
    );
  }

  /// `Early protection for your family health`
  String get Early_protection {
    return Intl.message(
      'Early protection for your family health',
      name: 'Early_protection',
      desc: '',
      args: [],
    );
  }

  /// `Top Doctor`
  String get Top_Doctor {
    return Intl.message(
      'Top Doctor',
      name: 'Top_Doctor',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get See_all {
    return Intl.message(
      'See all',
      name: 'See_all',
      desc: '',
      args: [],
    );
  }

  /// `Learn more`
  String get learn {
    return Intl.message(
      'Learn more',
      name: 'learn',
      desc: '',
      args: [],
    );
  }

  /// `Chardiologist`
  String get Chardiologist {
    return Intl.message(
      'Chardiologist',
      name: 'Chardiologist',
      desc: '',
      args: [],
    );
  }

  /// `Psychologist`
  String get Psychologist {
    return Intl.message(
      'Psychologist',
      name: 'Psychologist',
      desc: '',
      args: [],
    );
  }

  /// `Orthopedist,`
  String get Orthopedist {
    return Intl.message(
      'Orthopedist,',
      name: 'Orthopedist',
      desc: '',
      args: [],
    );
  }

  /// `Health article`
  String get Health_article {
    return Intl.message(
      'Health article',
      name: 'Health_article',
      desc: '',
      args: [],
    );
  }

  /// `Find a doctor`
  String get Find_a_doctor {
    return Intl.message(
      'Find a doctor',
      name: 'Find_a_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Find Doctors`
  String get Find_Doctors {
    return Intl.message(
      'Find Doctors',
      name: 'Find_Doctors',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get General {
    return Intl.message(
      'General',
      name: 'General',
      desc: '',
      args: [],
    );
  }

  /// `Lungs Specialist`
  String get Lungs_Specialist {
    return Intl.message(
      'Lungs Specialist',
      name: 'Lungs_Specialist',
      desc: '',
      args: [],
    );
  }

  /// `Dentist`
  String get Dentist {
    return Intl.message(
      'Dentist',
      name: 'Dentist',
      desc: '',
      args: [],
    );
  }

  /// `Psychiatrist`
  String get Psychiatrist {
    return Intl.message(
      'Psychiatrist',
      name: 'Psychiatrist',
      desc: '',
      args: [],
    );
  }

  /// `Covid-19`
  String get Covid_19 {
    return Intl.message(
      'Covid-19',
      name: 'Covid_19',
      desc: '',
      args: [],
    );
  }

  /// `Surgeon`
  String get Surgeon {
    return Intl.message(
      'Surgeon',
      name: 'Surgeon',
      desc: '',
      args: [],
    );
  }

  /// `Cardiologist`
  String get Cardiologist {
    return Intl.message(
      'Cardiologist',
      name: 'Cardiologist',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Doctors`
  String get Recommended_Doctors {
    return Intl.message(
      'Recommended Doctors',
      name: 'Recommended_Doctors',
      desc: '',
      args: [],
    );
  }

  /// `Your Recent Doctors`
  String get recent_doctors {
    return Intl.message(
      'Your Recent Doctors',
      name: 'recent_doctors',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Detail`
  String get doctor_detail {
    return Intl.message(
      'Doctor Detail',
      name: 'doctor_detail',
      desc: '',
      args: [],
    );
  }

  /// `Book Apointment`
  String get Book_Apointment {
    return Intl.message(
      'Book Apointment',
      name: 'Book_Apointment',
      desc: '',
      args: [],
    );
  }

  /// `Appointment`
  String get Appointment {
    return Intl.message(
      'Appointment',
      name: 'Appointment',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Payment Detail`
  String get payment_detail {
    return Intl.message(
      'Payment Detail',
      name: 'payment_detail',
      desc: '',
      args: [],
    );
  }

  /// `Consultation`
  String get Consultation {
    return Intl.message(
      'Consultation',
      name: 'Consultation',
      desc: '',
      args: [],
    );
  }

  /// `Admin Fee`
  String get admin_fee {
    return Intl.message(
      'Admin Fee',
      name: 'admin_fee',
      desc: '',
      args: [],
    );
  }

  /// `Aditional Discount`
  String get aditional_discount {
    return Intl.message(
      'Aditional Discount',
      name: 'aditional_discount',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get booking {
    return Intl.message(
      'Booking',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Payment Success`
  String get payment_success {
    return Intl.message(
      'Payment Success',
      name: 'payment_success',
      desc: '',
      args: [],
    );
  }

  /// `Your payment has been successful, you can have a consultation session with your trusted doctor`
  String get payment_successful {
    return Intl.message(
      'Your payment has been successful, you can have a consultation session with your trusted doctor',
      name: 'payment_successful',
      desc: '',
      args: [],
    );
  }

  /// `Chat Doctor`
  String get chat_doctor {
    return Intl.message(
      'Chat Doctor',
      name: 'chat_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Consultion Start`
  String get consultion_start {
    return Intl.message(
      'Consultion Start',
      name: 'consultion_start',
      desc: '',
      args: [],
    );
  }

  /// `You can consult your problem to the doctor`
  String get You_can_consult {
    return Intl.message(
      'You can consult your problem to the doctor',
      name: 'You_can_consult',
      desc: '',
      args: [],
    );
  }

  /// `Type message ...`
  String get type_message {
    return Intl.message(
      'Type message ...',
      name: 'type_message',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule`
  String get reschedule {
    return Intl.message(
      'Reschedule',
      name: 'reschedule',
      desc: '',
      args: [],
    );
  }

  /// `Psikeater`
  String get psikeater {
    return Intl.message(
      'Psikeater',
      name: 'psikeater',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get private {
    return Intl.message(
      'Private',
      name: 'private',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Arcticles`
  String get arcticles {
    return Intl.message(
      'Arcticles',
      name: 'arcticles',
      desc: '',
      args: [],
    );
  }

  /// `Popular Articles`
  String get popular_articles {
    return Intl.message(
      'Popular Articles',
      name: 'popular_articles',
      desc: '',
      args: [],
    );
  }

  /// `Search articles, news...`
  String get Search_articles {
    return Intl.message(
      'Search articles, news...',
      name: 'Search_articles',
      desc: '',
      args: [],
    );
  }

  /// `Trending Articles`
  String get trending_Articles {
    return Intl.message(
      'Trending Articles',
      name: 'trending_Articles',
      desc: '',
      args: [],
    );
  }

  /// `Related Articles`
  String get related_articles {
    return Intl.message(
      'Related Articles',
      name: 'related_articles',
      desc: '',
      args: [],
    );
  }

  /// `read`
  String get read {
    return Intl.message(
      'read',
      name: 'read',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy`
  String get pharmacy {
    return Intl.message(
      'Pharmacy',
      name: 'pharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Search drugs, category...`
  String get Search_drugs {
    return Intl.message(
      'Search drugs, category...',
      name: 'Search_drugs',
      desc: '',
      args: [],
    );
  }

  /// `Popular Product`
  String get popular_product {
    return Intl.message(
      'Popular Product',
      name: 'popular_product',
      desc: '',
      args: [],
    );
  }

  /// `Product on Sale`
  String get product_on_sale {
    return Intl.message(
      'Product on Sale',
      name: 'product_on_sale',
      desc: '',
      args: [],
    );
  }

  /// `Upload Prescription`
  String get upload_prescription {
    return Intl.message(
      'Upload Prescription',
      name: 'upload_prescription',
      desc: '',
      args: [],
    );
  }

  /// `Order quickly with Prescription`
  String get Order_quickly {
    return Intl.message(
      'Order quickly with Prescription',
      name: 'Order_quickly',
      desc: '',
      args: [],
    );
  }

  /// `Drugs Detail`
  String get Drugs_Detail {
    return Intl.message(
      'Drugs Detail',
      name: 'Drugs_Detail',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buy_now {
    return Intl.message(
      'Buy Now',
      name: 'buy_now',
      desc: '',
      args: [],
    );
  }

  /// `View Schedule`
  String get view_schedule {
    return Intl.message(
      'View Schedule',
      name: 'view_schedule',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message(
      'My Cart',
      name: 'my_cart',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message(
      'Confirmed',
      name: 'confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Taxes`
  String get taxes {
    return Intl.message(
      'Taxes',
      name: 'taxes',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get back_home {
    return Intl.message(
      'Back to Home',
      name: 'back_home',
      desc: '',
      args: [],
    );
  }

  /// `Ambulance`
  String get ambulance {
    return Intl.message(
      'Ambulance',
      name: 'ambulance',
      desc: '',
      args: [],
    );
  }

  /// `Consultation`
  String get consultation {
    return Intl.message(
      'Consultation',
      name: 'consultation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your address`
  String get confirm_address {
    return Intl.message(
      'Confirm your address',
      name: 'confirm_address',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Location`
  String get confirm_location {
    return Intl.message(
      'Confirm Location',
      name: 'confirm_location',
      desc: '',
      args: [],
    );
  }

  /// `My Saved`
  String get my_saved {
    return Intl.message(
      'My Saved',
      name: 'my_saved',
      desc: '',
      args: [],
    );
  }

  /// `Appointmnet`
  String get appointmnet {
    return Intl.message(
      'Appointmnet',
      name: 'appointmnet',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get read_more {
    return Intl.message(
      'Read more',
      name: 'read_more',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message(
      'Reason',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Chest pain`
  String get chest_pain {
    return Intl.message(
      'Chest pain',
      name: 'chest_pain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
