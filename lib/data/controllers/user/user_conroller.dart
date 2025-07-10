import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../featuers/authentication/login/views/screens/login_screen.dart';
import '../../../featuers/profile_featuers/edit_profile/views/screens/re_authenticate_screen.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/app_popups.dart';
import '../../models/user/user_model.dart';
import '../../repositories/authentication_repository/authentication_repository.dart';
import '../../repositories/user_repository/user_repository.dart';

class UserController extends GetxController {
  //instance creator
  static UserController get instance => Get.find();

  //variabels
  Rx<UserModel> currentUser = UserModel.empty().obs;
  Rx<bool> profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());

  //reauthentication variabels
  final TextEditingController verifyEmail = TextEditingController();
  final TextEditingController verifyPassword = TextEditingController();
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  Rx<bool> passwordVisabilty = true.obs;

  //on intit
  @override
  void onInit() {
    fatchUserData();
    super.onInit();
  }

  //fatch user data
  Future<void> fatchUserData() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fatchUserData();
      currentUser(user);
      profileLoading.value = false;
    } catch (e) {
      currentUser(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //delete user account
  Future<void> deletUserAccount() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }

      //start loading screen
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //authrepository instance
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteUserAccount();
          AppPopups.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          AppPopups.stopLoading();
          Get.to(() => const ReAuthenticationScree());
        }
      }
    } catch (e) {
      AppPopups.stopLoading();
      AppPopups.showErrorSnackBar(title: "oh opps", message: e.toString());
    }
  }

  // email and password reauthentication
  Future<void> reAuthenticateWithEmailAndPassword() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }
      //validate inputes
      if (!reAuthFormKey.currentState!.validate()) return;

      //start loading screen
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //reauthenticate
      await AuthenticationRepository.instance.reauthenticateWithEmailPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteUserAccount().then((value) {
        AppPopups.showSuccessSnackBar(title: "Done", message: "Deleted succesfully");
      });

      //stop loading
      AppPopups.stopLoading();

      //redirect to login screen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      AppPopups.stopLoading();
      AppPopups.showErrorSnackBar(title: "oh opps", message: e.toString());
    }
  }

  //upload user image
  Future<void> uploadUserImage() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }

      //pick user image from gallary
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxWidth: 512, maxHeight: 512);
      if (image != null) {
        //profile loading
        profileLoading.value = true;

        // upload user image to firestorage
        final imageUrl = await userRepository.uploadUserImage("Users/Profiles/Images/", image);

        //update user image in user record
        await userRepository.updateUserSpaciceFields({"profileImage": imageUrl});

        //update user image at local data
        currentUser.value.profileImage = imageUrl;

        //refresh user
        currentUser.refresh();

        //show success massege
        AppPopups.showSuccessSnackBar(title: "Done", message: "Your image updated successfully");
      }
    } catch (e) {
      AppPopups.showErrorSnackBar(title: "oh opps", message: e.toString());
    } finally {
      // stop profile loading
      profileLoading.value = false;
    }
  }
}
