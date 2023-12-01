import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/config/routes/routes.dart';
import 'package:projeto_uniclima_v2/modules/app_splash_screen/lib/bindings/splash.binding.dart';
import 'package:projeto_uniclima_v2/modules/app_splash_screen/lib/views/splash.view.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/bindings/home.binding.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/view/home.dart';

class PagesRoutes {
  static final pagesRoutes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
      transition: Transition.cupertino,
    ),
  ];
}
