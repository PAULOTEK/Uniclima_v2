import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_uniclima_v2/config/configs.dart';
import 'package:projeto_uniclima_v2/model/clima_model.dart';
import 'package:projeto_uniclima_v2/repository/repositories/clima_repository.dart';

class HomeRespository extends ClimaRepository {
  Future<ClimaData?> carregaTempo(String cidadeSelecionada) async {
    const String lang = 'pt_br';
    const String units = 'metric';

    final params = {
      "q": cidadeSelecionada,
      "appid": keyOpenweathermap,
      "units": units,
      "lang": lang
    };

    try {
      Response? response = await httpClient
          .get("${ClimaRepositoryEndpoint.API_DATA.url} $params");

      if (kDebugMode) {
        print('Url montada: ${response.requestOptions.uri}');
      }

      if (response.statusCode == 200) {
        return ClimaData.fromJson(jsonDecode(response.data));
      }
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao carregar o clima: $error');
      }
    }
  }
}
