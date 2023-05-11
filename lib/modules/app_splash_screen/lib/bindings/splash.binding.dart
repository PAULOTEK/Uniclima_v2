import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/modules/app_splash_screen/lib/controllers/splash.controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
