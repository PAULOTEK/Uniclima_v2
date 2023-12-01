import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_uniclima_v2/config/configs.dart';
import 'package:projeto_uniclima_v2/model/clima_model.dart';
import 'package:projeto_uniclima_v2/repository/repositories/clima_repository.dart';

class HomeRepository extends ClimaRepository {
  final Dio _dio = Dio();
  Future<ClimaData?> carregaTempo(String cidadeSelecionada) async {
    const String lang = 'pt_br';
    const String units = 'metric';

    final params = {
      "q": cidadeSelecionada,
      "appid": keyOpenweathermap,
      "units": units,
      "lang": lang,
    };

    try {
      final Uri uri = Uri.parse("$baseUrl/data/2.5/weather")
          .replace(queryParameters: params);

      Response? response = await _dio.get(uri.toString());

      if (kDebugMode) {
        print('Url montada: ${response.requestOptions.uri}');
      }
      return ClimaData.fromJson2(response.data);
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao carregar o clima: $error');
      }
      return null;
    }
  }
}
