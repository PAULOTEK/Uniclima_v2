import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../config/configs.dart';
import 'interceptors/custom_interceptor.http.dart';

class CustomDio extends DioForNative {
  late Dio _dio;

  static final CustomDio _instance = CustomDio._internal();

  factory CustomDio() => _instance;

  Dio get http => _dio;

  CustomDio._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: "application/json",
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 5000),
      ),
    );

    _dio.interceptors.add(CustomInterceptors());
  }
}
