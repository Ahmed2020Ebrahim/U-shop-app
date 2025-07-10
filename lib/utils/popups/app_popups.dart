import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/alert_dialogs/alert_dialoges.dart';
import '../../common/widgets/loaders/animated_loader.dart';
import '../../common/widgets/snackbars/snackbars.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class AppPopups {
  AppPopups._();

  //fullscreen loader
  static void openFullScreenLoader({String? text, required String animation}) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Center(
            child: Container(
              height: double.infinity,
              color: HelperFunctions.isDarkMode(Get.context!) ? AppColors.dark : AppColors.light,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedLoader(text: text, animation: animation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //warning snackbar
  static void showWarningSnackBar({required String title, required String message}) {
    SnackBars.warningSnackBar(title: title, message: message);
  }

  //error snackbar
  static void showErrorSnackBar({required String title, required String message}) {
    SnackBars.errorSnackBar(title: title, message: message);
  }

  //success snackbar
  static void showSuccessSnackBar({required String title, required String message}) {
    SnackBars.successSnackBar(title: title, message: message);
  }

  // stop loading
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }

  //alert dialog
  static showCancelConfirmAlertDialog({required String title, required String content, Function()? onCancel, Function()? onConfirm}) {
    AppAlertDialoges.cancelConfirmAlertDialog(title: title, content: content, onCancel: onCancel, onConfirm: onConfirm);
  }
}
