import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAlertDialoges {
  static cancelConfirmAlertDialog({required String title, required String content, Function()? onCancel, Function()? onConfirm}) {
    Get.defaultDialog(
      content: Text(content),
      title: title,
      onCancel: onCancel,
      onConfirm: onConfirm,
      textCancel: "cancel",
      textConfirm: "confirm",
    );
  }
}
