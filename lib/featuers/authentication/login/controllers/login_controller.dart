import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../data/repositories/user_repository/user_repository.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/app_popups.dart';

class LoginController extends GetxController {
  // instance creator
  static LoginController get instance => Get.find();

  //variabels
  final Rx<bool> passwordVisabilty = true.obs;
  final Rx<bool> rememberMe = false.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //local storage instance
  final localStorage = GetStorage();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  //! --------------- functions -----------

  //password toggel
  void passwordVisabiltyToggel() {
    passwordVisabilty.value == !passwordVisabilty.value;
  }

  //remmember me toggel
  void rememberMeToggle() {
    rememberMe.value == !rememberMe.value;
  }

  //---------------------------[sing in with email and password]---------------------//
  //user login with email and password
  Future<void> login() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }

      //validation check
      if (!loginFormKey.currentState!.validate()) return;

      //start loading screen
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //login with email and password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text);

      //set local data if remmember me is true
      if (rememberMe.value) {
        await localStorage.write("REMEMBER_ME_EMAIL", email.text);
        await localStorage.write("REMEMBER_ME_PASSWORD", password.text);
      }

      //stop loading screen
      AppPopups.stopLoading();

      //screen redirection
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppPopups.stopLoading();
      //show error happened
      AppPopups.showErrorSnackBar(title: "oh Opps", message: e.toString());
    }
  }

  //-------------------------------------[sign in with google]----------------------------------
  Future<void> googleSignIn() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }

      //start loading screen
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //google sign in
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      //save authenticated user data in firebase firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveSocialUserRecord(userCredential);

      //stop loading screen
      AppPopups.stopLoading();

      //screen redirection
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppPopups.stopLoading();
      //show error happened
      AppPopups.showErrorSnackBar(title: "oh Opps", message: e.toString());
    }
  }
}
