import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClimaInfoAlert {
  final String title;
  final Widget body;

  ClimaInfoAlert({required this.title, required this.body}) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.infoReverse,
      animType: AnimType.scale,
      title: title,
      autoHide: const Duration(seconds: 5),
      autoDismiss: true,
      headerAnimationLoop: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: body,
        ),
      ),
    ).show();
  }
}
