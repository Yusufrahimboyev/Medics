import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/model/medics_model.dart';
import '../../../../common/service/api_service.dart';

abstract interface class IMainRepository {
  const IMainRepository();

  Future<List<DoctorModel>> getDoctor({required BuildContext context});

  Future<List<ArticleModel>> getArticles({required BuildContext context});
}

class MainRepositoryImpl implements IMainRepository {
  final ApiService apiService;

  MainRepositoryImpl({required this.apiService});

  @override
  Future<List<DoctorModel>> getDoctor({required BuildContext context}) async {
    final response = await apiService.request(
      Urls.getDoctors,
      headers: {
        'Authorization':
            'Bearer ${context.dependencies.shp.get(Constants.token)}',
      },
      queryParams: {
        "page": 0,
        "size": 10,
      },
    );

    return List<Map<String, Object?>>.from(response['data'] as List)
        .whereType<Map<String, Object?>>()
        .map(DoctorModel.fromJson)
        .toList();
  }

  @override
  Future<List<ArticleModel>> getArticles(
      {required BuildContext context}) async {
    final response = await apiService.request(
      Urls.getArticles,
      headers: {
        'Authorization':
            'Bearer ${context.dependencies.shp.get(Constants.token)}',
      },
      queryParams: {
        "page": 0,
        "size": 10,
      },
    );

    return List<Map<String, Object?>>.from(response['data'] as List)
        .whereType<Map<String, Object?>>()
        .map(ArticleModel.fromJson)
        .toList();
  }
}
