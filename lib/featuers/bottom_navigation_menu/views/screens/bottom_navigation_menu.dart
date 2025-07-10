import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controller/bottom_navigation_menu_controller.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    BottomNavigationMenuController controller = BottomNavigationMenuController.instance;
    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: isDark ? AppColors.black : AppColors.lightContainer,
          selectedIndex: BottomNavigationMenuController.instance.selectedIndex.value,
          onDestinationSelected: controller.changePage,
          height: 80,
          indicatorColor: isDark ? AppColors.darkerGrey : AppColors.grey,
          elevation: 0,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: AppTexts.homeLebel),
            NavigationDestination(icon: Icon(Iconsax.shop), label: AppTexts.storeLebel),
            NavigationDestination(icon: Icon(Iconsax.heart), label: AppTexts.favoritLebel),
            NavigationDestination(icon: Icon(Iconsax.user), label: AppTexts.profileLebel),
          ],
        ),
        body: controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : controller.pages[BottomNavigationMenuController.instance.selectedIndex.value],
      ),
    );
  }
}
