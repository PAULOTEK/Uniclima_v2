import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/model/clima_model.dart';

mixin HomeMixin {
  RxString cidadeSelecionada = 'São Paulo'.obs;
  RxBool isLoading = false.obs;
  Rx<ClimaData?> climaData = Rx<ClimaData?>(null);
  Dio dio = Dio();
}
