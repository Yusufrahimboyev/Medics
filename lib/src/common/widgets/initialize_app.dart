import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:medics/src/common/constants/constants.dart';
import 'package:medics/src/common/dependency/dependency.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitializeApp {
  Future<AppDependency> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
    final shp = await SharedPreferences.getInstance();
    bool theme = shp.getBool(Constants.theme) ?? false;
    String locale = shp.getString(Constants.locale) ?? "en";

    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),

      )
    );
    return AppDependency(sharedPreferences: shp, locale: locale, theme: theme);
  }
}
