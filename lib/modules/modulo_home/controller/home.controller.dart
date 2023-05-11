import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/model/clima_model.dart';

class HomeController extends GetxController {
  final List<String> cidades = [
    'Aracaju',
    'Belém',
    'Belo Horizonte',
    'Boa Vista',
    'Brasilia',
    'Campo Grande',
    'Cuiaba',
    'Curitiba',
    'Florianópolis',
    'Fortaleza',
    'Goiânia',
    'João Pessoa',
    'Macapá',
    'Maceió',
    'Manaus',
    'Natal',
    'Palmas',
    'Porto Alegre',
    'Porto Velho',
    'Recife',
    'Rio Branco',
    'Rio de Janeiro',
    'Salvador',
    'São Luiz',
    'São Paulo',
    'Teresina',
    'Vitoria',
  ];

  RxString cidadeSelecionada = 'São Paulo'.obs;
  RxBool isLoading = false.obs;
  Rx<ClimaData?> climaData = Rx<ClimaData?>(null);
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    carregaTempo();
  }

  void atualizarCidadeSelecionada(String cidade) {
    cidadeSelecionada.value = cidade;
    carregaTempo();
  }

  Future<void> carregaTempo() async {
    isLoading.value = true;

    const String appid =
        '65d7bbf43a1a218d1c43d651e08c6e64'; //Coloque aqui a SUA chave de API
    const String lang = 'pt_br';
    const String units = 'metric';
    const String apiURL = 'api.openweathermap.org';
    const String path = '/data/2.5/weather';
    final params = {
      "q": cidadeSelecionada.value,
      "appid": appid,
      "units": units,
      "lang": lang
    };

    try {
      final response =
          await dio.get(Uri.https(apiURL, path, params).toString());

      if (kDebugMode) {
        print('Url montada: ${response.requestOptions.uri}');
      }

      if (response.statusCode == 200) {
        climaData.value = ClimaData.fromJson(jsonDecode(response.data));
      }
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao carregar o clima: $error');
      }
    }

    isLoading.value = false;
  }
}
