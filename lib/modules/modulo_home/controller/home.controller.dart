import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/model/clima_model.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/controller/mixin/home.mixin.dart';
import 'package:projeto_uniclima_v2/widgets/alerts/clima_error.alert.dart';

class HomeController extends GetxController with HomeMixin {
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
    ClimaData? mClimas = await repository.carregaTempo(cidadeSelecionada.value);
    isLoading.value = false;

    if (mClimas == null) {
      print('Erro ao carregar o clima. Resposta nula.');
      ClimaErrorAlert(
        title: "Error".tr,
        body: Text(
          "Houve erro ao consultar o clima do ponto extra.".tr,
        ),
      );
    } else {
      climaData.value = mClimas;
      climaData.refresh();
    }
  }
}
