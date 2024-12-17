// The abstract interface class
import '../../../../common/constants/constants.dart';
import '../../../../common/model/medics_model.dart';
import '../../../../common/service/api_service.dart';

abstract interface class IMainRepository {
  const IMainRepository();

  Future<DoctorModel> getDoctorById(int id);

  Future<Map<String, Object?>> getDoctor({
    required String firstName,
    required String lastName,
    required String speciality,
    required double price,
    required double rating,
    required double latitude,
    required double longitude,
    required String imageUrl,
    required String about,
  });
}

class MainRepositoryImpl implements IMainRepository {
  final ApiService apiService;

  MainRepositoryImpl({required this.apiService});

  @override
  Future<DoctorModel> getDoctorById(int id) async {
    final response = await apiService.request(
      Urls.getDoctorById,
      method: Method.get,
      queryParams: {'id': id},
    );

    return DoctorModel.fromJson(response);
  }

  @override
  Future<Map<String, Object?>> getDoctor({
    required String firstName,
    required String lastName,
    required String speciality,
    required double price,
    required double rating,
    required double latitude,
    required double longitude,
    required String imageUrl,
    required String about,
  }) async {
    final response = await apiService.request(
      Urls.getDoctors,
      method: Method.get,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'speciality': speciality,
        'price': price,
        'rating': rating,
        'latitude': latitude,
        'longitude': longitude,
        'imageUrl': imageUrl,
        'about': about,
      },
    );

    return response;
  }

}