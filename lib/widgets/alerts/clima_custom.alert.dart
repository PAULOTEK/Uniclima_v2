import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClimaCustomAlert {
  final String title;
  final Widget body;
  final Duration? autoHide;
  final bool autoDismiss;
  final bool headerAnimationLoop;
  final DialogType dialogType;
  final AnimType animType;
  final Widget? btnCancel;
  final Widget? btnOk;
  final bool dismissOnTouchOutside;
  final bool dismissOnBackKeyPress;

  ClimaCustomAlert(
      {required this.title,
      required this.body,
      this.btnCancel,
      this.btnOk,
      this.autoHide,
      this.dismissOnBackKeyPress = true,
      this.dialogType = DialogType.infoReverse,
      this.autoDismiss = true,
      this.dismissOnTouchOutside = true,
      this.animType = AnimType.scale,
      this.headerAnimationLoop = false}) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: dialogType,
      animType: animType,
      title: title,
      autoHide: autoHide,
      autoDismiss: autoDismiss,
      headerAnimationLoop: headerAnimationLoop,
      btnCancel: btnCancel,
      dismissOnTouchOutside: dismissOnTouchOutside,
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      btnOk: btnOk,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: body,
        ),
      ),
    ).show();
  }
}
