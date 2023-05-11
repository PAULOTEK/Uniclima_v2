import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/view/home.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    proceed();
    super.onInit();
  }

  void proceed() {
    Future.delayed(
      const Duration(seconds: 3),
      () async => const HomeView(),
    );
  }
}
