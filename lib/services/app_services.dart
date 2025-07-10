import 'package:get/get.dart';

class AppServices extends GetxService {
  Future<AppServices> _init() async {
    return this;
  }

  static Future initServices() async {
    await Get.putAsync(() => AppServices()._init());
  }
}
