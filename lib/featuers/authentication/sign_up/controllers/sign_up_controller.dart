import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user/user_model.dart';
import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../data/repositories/user_repository/user_repository.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/app_popups.dart';
import '../views/screens/email_verify_screen.dart';

class SignUpController extends GetxController {
  //create instance
  static SignUpController get instance => Get.find();

  //variabels
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  Rx<bool> privacyPolicyValue = false.obs;
  Rx<bool> hidePassword = true.obs;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  //!--->    //---METHODS----//

  //sign up
  Future<void> signUp() async {
    try {
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showWarningSnackBar(title: "No NetWork", message: "please check your internet connection and try again");
        return;
      }

      //form validation
      if (!signUpFormKey.currentState!.validate()) return;

      //check privacy policy
      if (!privacyPolicyValue.value) {
        AppPopups.showWarningSnackBar(title: "privicy policy agrement required", message: "please check the privacy policy agreement and try again");
        return;
      }

      //start loading
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //regester user in firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text);
      final user = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profileImage: "",
      );

      //save authenticated user data in firebase firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(user);

      //stop loading screen
      AppPopups.stopLoading();

      //show success message
      AppPopups.showSuccessSnackBar(title: "successfully done", message: "you have successfully signed up");

      // go to email verify screen
      Get.to(() => EmailVerifyScreen(email: email.text));

      //
    } catch (e) {
      AppPopups.stopLoading();
      // show generic error for the user
      AppPopups.showErrorSnackBar(title: "Oppss Error", message: e.toString());
    }
  }

  //change privacy policy value
  void changePrivacyPolicyValue(bool? value) {
    privacyPolicyValue.value = value!;
  }
}
