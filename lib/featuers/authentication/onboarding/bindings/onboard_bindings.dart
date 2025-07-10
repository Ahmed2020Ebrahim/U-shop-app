import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';

class OnBoardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardController());
  }
}
