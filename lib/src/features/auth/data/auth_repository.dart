import 'package:medics/src/common/constants/constants.dart';
import 'package:medics/src/common/service/api_service.dart';

abstract interface class IAuthRepository {
  const IAuthRepository._();

  Future<Map<String, Object?>> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<Map<String, Object?>> signUpVerify(
      {required String email, required String code});
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
        "firstname": username,
        "lastName": "a",
        "age": 18,
        "gender": "male"
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
}
