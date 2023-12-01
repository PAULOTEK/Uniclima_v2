import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClimaErrorAlert {
  final String title;
  final Widget body;
  final bool autoDismiss;
  final Widget? btnOk;
  final Function()? btnOkOnPress;
  final Function(DismissType)? onDismissCallback;
  final bool dismissOnTouchOutside;

  ClimaErrorAlert(
      {required this.title,
      required this.body,
      this.btnOkOnPress,
      this.autoDismiss = true,
      this.dismissOnTouchOutside = true,
      this.onDismissCallback,
      this.btnOk}) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: title,
      titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
      dismissOnTouchOutside: dismissOnTouchOutside,
      onDismissCallback: onDismissCallback,
      autoHide: const Duration(seconds: 5),
      autoDismiss: autoDismiss,
      btnOk: btnOk,
      headerAnimationLoop: false,
      btnOkOnPress: btnOkOnPress,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: body,
        ),
      ),
    ).show();
  }
}
