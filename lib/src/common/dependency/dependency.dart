import 'package:medics/src/features/home/main/data/main_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/auth_repository.dart';

class AppDependency {
  AppDependency({
    required this.authRepository,
    required this.mainRepository,
    required this.shp,
    required this.locale,
    required this.theme,
  });

  String locale;
  bool theme;
  final SharedPreferences shp;
  final IAuthRepository authRepository;
  final IMainRepository mainRepository;
}
