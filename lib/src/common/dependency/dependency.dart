import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/auth_repository.dart';
import '../../features/home/main/data/main_repository.dart';

class AppDependency {
  AppDependency( {
    required this.mainRepository,
    required this.authRepository,
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
