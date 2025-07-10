import 'package:get/get.dart';

import '../controller/bottom_navigation_menu_controller.dart';

class BottomNavigationMenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationMenuController());
  }
}
