import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/model/clima_model.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/repository/home.repository.dart';

mixin HomeMixin {
  RxString cidadeSelecionada = 'São Paulo'.obs;
  RxBool isLoading = false.obs;
  final repository = HomeRepository();
  Rx<ClimaData?> climaData = Rx<ClimaData?>(null);
  Dio dio = Dio();
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
}
