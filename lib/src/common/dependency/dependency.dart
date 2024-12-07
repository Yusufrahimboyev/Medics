import 'package:shared_preferences/shared_preferences.dart';

class AppDependency {
  AppDependency(
      {required this.shp,
      required this.locale,
      required this.theme});

  String locale;
  bool theme;
  final SharedPreferences shp;
}
