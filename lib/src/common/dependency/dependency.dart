import 'package:shared_preferences/shared_preferences.dart';

class AppDependency {
  AppDependency(
      {required this.sharedPreferences,
      required this.locale,
      required this.theme});

  String locale;
  bool theme;
  final SharedPreferences sharedPreferences;
}
