import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/theme/assets/resources/resources.dart';

import '../controllers/splash.controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() => Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Image.asset(
            Images.cat01,
          ),
        ),
      );
}
