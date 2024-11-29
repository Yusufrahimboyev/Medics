import 'package:medics/src/features/auth/data/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependency {
  AppDependency({
    required this.sharedPreferences,
    required this.locale,
    required this.theme,
    required this.authRepository,
  });

  String locale;
  bool theme;
  final SharedPreferences sharedPreferences;

  final IAuthRepository authRepository;
}
