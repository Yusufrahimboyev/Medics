import 'package:medics/src/common/constants/constants.dart';
import 'package:medics/src/common/service/api_service.dart';

abstract interface class IAuthRepository {
  const IAuthRepository._();

  Future<Map<String, Object?>> signUp({
    required String username,
    required String email,
    required String password,
  });
  Future<Map<String, Object?>> logIn({
    required String email,
    required String password,
  });

  Future<Map<String, Object?>> signUpVerify(
      {required String email, required String code});
  Future<Map<String, Object?>> passwordVerify(
      {required String email, required String code});
  Future<Map<String, Object?>> resetEmail({required String email});
  Future<Map<String, Object?>> newPassword({
    required String email,
    required String password,
    required String token,
  });
}

class AuthRepositoryImpl implements IAuthRepository {
  const AuthRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Map<String, Object?>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await apiService.request(
      Urls.authSignUp,
      data: {
        "email": email,
        "password": password,
        "username": username,
      },
      method: Method.post,
    );
    return response;
  }

  @override
  Future<Map<String, Object?>> signUpVerify({
    required String email,
    required String code,
  }) async {
    try {
      final response = await apiService
          .request(Urls.authAccountConfirm, method: Method.post, data: {
        "email": email,
        "code": code,
      });
      return response;
    } on Object catch (e) {
      return {};
    }
  }

  @override
  Future<Map<String, Object?>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          apiService.request(Urls.authLogIn, method: Method.post, data: {
        "username": email,
        "password": password,
      });
      return response;
    } on Object catch (e) {
      return {};
    }
  }

  @override
  Future<Map<String, Object?>> resetEmail({required String email}) async {
    try {
      final response = apiService
          .request(Urls.resetEmailPassword, method: Method.post, data: {
        "email": email,
      });
      return response;
    } on Object catch (e) {
      return {};
    }
  }

  @override
  Future<Map<String, Object?>> passwordVerify({
    required String email,
    required String code,
  }) async {
    try {
      final response = await apiService
          .request(Urls.authPasswordConfirm, method: Method.post, data: {
        "email": email,
        "code": code,
      });
      return response;
    } on Object catch (e) {
      return {};
    }
  }

  @override
  Future<Map<String, Object?>> newPassword({required String email, required String password, required String token}) async {
    try {
      final response = await apiService
          .request(Urls.authPassword, method: Method.post, data: {
        "email": email,
        "password": password,
        "token": token,
      });
      return response;
    } on Object catch (e) {
      return {};
    }
  }
}
