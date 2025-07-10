import 'package:get/get.dart';
import 'package:ushop/data/controllers/category/category_controller.dart';
import 'package:ushop/data/controllers/products/products_controller.dart';
import 'package:ushop/featuers/bottom_navigation_menu/controller/bottom_navigation_menu_controller.dart';

import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ProductController(), permanent: true);
    Get.put(CategoryController(), permanent: true);
    Get.put(BottomNavigationMenuController(), permanent: true);
  }
}
