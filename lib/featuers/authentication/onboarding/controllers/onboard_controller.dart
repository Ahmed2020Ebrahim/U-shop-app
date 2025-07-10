import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constants/shared_pref_keys.dart';
import '../../login/views/screens/login_screen.dart';

class OnBoardController extends GetxController {
  //! --- For dependancy Injection
  static OnBoardController get instansce => Get.find();

  //! --- Variabels
  PageController pageViewController = PageController();
  Rx<int> currentPage = 0.obs;

  //! --- On Skip Button Clicked
  Future<void> onBoardingSkip() async {
    final deviceStorage = GetStorage();
    deviceStorage.write(SharedPrefKeys.isFirstTime, false);
    Get.offAll(() => const LoginScreen());
  }

  //! --- On Page Scrolling Using Indecators
  void indecatorScrolle(int index) {
    updateCurrentPage(index);
    pageViewController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  //! --- On Next Button Clicked
  Future<void> goNext() async {
    if (pageViewController.page == 2) {
      final deviceStorage = GetStorage();
      deviceStorage.write(SharedPrefKeys.isFirstTime, false);
      Get.offAll(() => const LoginScreen());
    }
    pageViewController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  //! --- update current page
  void updateCurrentPage(int index) {
    currentPage.value = index;
  }
}
