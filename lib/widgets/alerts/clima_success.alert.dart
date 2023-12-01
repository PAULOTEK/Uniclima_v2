import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClimaSuccessAlert {
  final String title;
  final Widget body;

  bool isShowing = true;

  ClimaSuccessAlert({required this.title, required this.body}) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: title,
      autoHide: const Duration(seconds: 2),
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
