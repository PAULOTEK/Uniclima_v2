// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_uniclima_v2/repository/repositories/custom_dio.dart';

class ClimaRepository extends DioForNative {
  final CustomDio _customDio = CustomDio();

  Dio get httpClient => _customDio.http;
}

enum ClimaRepositoryEndpoint {
  API_DATA,
}

extension ClimaRepositoryEndpointExtension on ClimaRepositoryEndpoint {
  String get name => describeEnum(this);

  String get url {
    switch (this) {
      case ClimaRepositoryEndpoint.API_DATA:
        return "/data/3.0/weather";
      default:
        throw ("URL API NOT DEFINED");
    }
  }
}
