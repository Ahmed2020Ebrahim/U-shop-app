import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/popups/app_popups.dart';
import '../../models/banners/banners_model.dart';
import '../../repositories/banner_repository/banner_repository.dart';

class BannerController extends GetxController {
  // instance creatro
  static BannerController get instance => Get.find();
  RxList<BannerModel> allBanners = <BannerModel>[].obs;
  RxList<BannerModel> activeBanners = <BannerModel>[].obs;
  Rx<bool> loader = false.obs;

  final _bannerRepository = Get.put(BannerRepository());

  //! --- Variabels
  PageController pageViewController = PageController();
  Rx<int> currentPage = 0.obs;

  //on init
  @override
  void onInit() {
    fatchBanners();
    super.onInit();
  }

  //! --- On Page Scrolling Using Indecators
  void indecatorScrolle(int index) {
    updateCurrentPage(index);
    pageViewController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  //! --- update current page
  void updateCurrentPage(int index) {
    currentPage.value = index;
  }

  // Fatch banners
  Future<void> fatchBanners() async {
    try {
      // start loader
      loader.value = true;
      // fatch all categories
      final banners = await _bannerRepository.getBanners();
      // update allCategories
      allBanners.assignAll(banners);

      //update featured categories
      activeBanners.assignAll(banners.where((element) => element.isActive));
      // stop loader
      loader.value = false;
    } catch (e) {
      AppPopups.showErrorSnackBar(title: "oh oops", message: e.toString());
    } finally {
      //stop loader
      loader.value = false;
    }
  }
}
