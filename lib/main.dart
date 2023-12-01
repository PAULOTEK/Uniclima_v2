import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/config/pages.dart';
import 'package:projeto_uniclima_v2/config/routes.dart';
import 'package:projeto_uniclima_v2/initial_bindings/initial.bindings.dart';
import 'package:projeto_uniclima_v2/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TempoApp());
}

class TempoApp extends StatelessWidget {
  const TempoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      title: 'Previsão do Tempo',
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      theme: lightTreme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      fallbackLocale: const Locale('pt', 'BR'),
      getPages: PagesRoutes.pagesRoutes,
      //translations: CompartMessages(),
      initialBinding: InitialBindings(),
      initialRoute: Routes.splash,
    );
  }
}
