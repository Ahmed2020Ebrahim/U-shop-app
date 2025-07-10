import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/controllers/user/user_conroller.dart';
import '../../../../data/repositories/user_repository/user_repository.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/app_popups.dart';
import '../../profile/views/screens/profile_screen.dart';

class EditFullNameController extends GetxController {
  //instance creator
  static EditFullNameController get instance => Get.find();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final GlobalKey<FormState> editNameFormKey = GlobalKey<FormState>();

  final user = Get.put(UserController());
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initFullName();
    super.onInit();
  }

  //set initial values of user full name
  void initFullName() {
    firstName.text = user.currentUser.value.firstName;
    lastName.text = user.currentUser.value.lastName;
  }

  //save new name
  Future<void> updateFullName() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }

      //check validation
      if (!editNameFormKey.currentState!.validate()) return;

      //start loading screen
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Processing your data ....");

      //update user data
      await userRepository.updateUserSpaciceFields({"firstName": firstName.text.trim(), "lastName": lastName.text.trim()});

      //update current user data
      UserController.instance.currentUser.value.firstName = firstName.text;
      UserController.instance.currentUser.value.lastName = lastName.text;

      //stop loading screen
      AppPopups.stopLoading();

      //show success message
      AppPopups.showSuccessSnackBar(title: "Congratulations", message: "your name has been apdated");

      //redirect to profile screen
      Get.to(() => const ProfielScreen());
    } catch (e) {
      AppPopups.stopLoading();
      AppPopups.showErrorSnackBar(title: "oh opps ", message: e.toString());
    }
  }
}
