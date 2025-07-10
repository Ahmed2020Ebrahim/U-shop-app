import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../favorits/views/screens/favorites_screen.dart';
import '../../home/views/screens/home_screen.dart';
import '../../profile_featuers/profile/views/screens/profile_screen.dart';
import '../../store/views/screens/store_screen.dart';

class BottomNavigationMenuController extends GetxController {
  //--- instance creation ----
  static BottomNavigationMenuController get instance => Get.find();

  //loader
  RxBool isLoading = false.obs;

  //--- variabels
  Rx<int> selectedIndex = 0.obs;

  //--- navigation pages
  List<Widget> pages = const [HomeScreen(), StoreScreen(), FavoritesScreen(), ProfielScreen()];

  //--- change index
  void changePage(int index) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500), () {
      isLoading.value = false;
    });
    selectedIndex.value = index;
  }
}
