import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/controller/home.controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
