import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/app_popups.dart';
import '../views/screens/reset_email_sent_screen.dart';

class ForgetPasswordController extends GetxController {
  // instance creator
  static ForgetPasswordController get instance => Get.find();

  //variabels
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //methods
  //send password reset email
  void sendPasswordResetEmail() async {
    try {
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showWarningSnackBar(title: "No NetWork", message: "please check your internet connection and try again");
        return;
      }

      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) return;

      //start loading
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //send password reset email
      await AuthenticationRepository.instance.sendResetPasswordEmail(email.text.trim());

      //remove loading screen
      AppPopups.stopLoading();

      //show success snack bar
      AppPopups.showSuccessSnackBar(title: "sent successfully", message: "an reset password email has been sent to you , please check your inbox");

      //go to resetemailsentscreen
      Get.to(() => ResetEmailSentScreen(email: email.text.trim()));
    } catch (e) {
      // stop loading spinner screen
      AppPopups.stopLoading();
      AppPopups.showErrorSnackBar(title: "oh opps", message: e.toString());
    }
  }

  //send password reset email
  void reSendPasswordResetEmail(String email) async {
    try {
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showWarningSnackBar(title: "No NetWork", message: "please check your internet connection and try again");
        return;
      }

      //start loading
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //send password reset email
      await AuthenticationRepository.instance.sendResetPasswordEmail(email);

      //remove loading screen
      AppPopups.stopLoading();

      //show success snack bar
      AppPopups.showSuccessSnackBar(title: "sent successfully", message: "an reset password email has been sent to you , please check your inbox");
    } catch (e) {
      // stop loading spinner screen
      AppPopups.stopLoading();
      AppPopups.showErrorSnackBar(title: "oh opps", message: e.toString());
    }
  }
}
