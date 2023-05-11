import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/modules/app_splash_screen/lib/controllers/splash.controller.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/controller/home.controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => HomeController());
  }
}
