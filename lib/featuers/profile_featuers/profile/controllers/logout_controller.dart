import 'package:get/get.dart';
import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/app_popups.dart';

class LogoutController extends GetxController {
  //instance creator
  static LogoutController get instance => Get.find();

  //logout function
  Future<void> logout() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }

      Get.back();

      //show loading screen
      AppPopups.openFullScreenLoader(animation: AppImages.loaderSpiner, text: "Logging out ...");

      //log out
      await AuthenticationRepository.instance.logOut();

      //stop loading screen
      AppPopups.stopLoading();

      //screen redirection
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppPopups.stopLoading();
      AppPopups.showErrorSnackBar(title: "oh opps", message: e.toString());
    }
  }
}
