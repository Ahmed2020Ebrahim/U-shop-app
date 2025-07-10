import 'package:get/get.dart';

import '../../../utils/popups/app_popups.dart';
import '../../models/brand/brand_model.dart';
import '../../repositories/brand_repository/brand_repository.dart';

class BrandsController extends GetxController {
  //instance creator
  static BrandsController get instance => Get.find();

  //all brands
  RxList<BrandModel> allBrands = <BrandModel>[].obs;

  //featured brands
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  //loader
  Rx<bool> loader = false.obs;

  //brandrepository instance
  final _brandRepository = Get.put(BrandRepository());

  //current brand
  Rx<BrandModel> currentBrand = BrandModel.emptyBrandModel().obs;

  //on init
  @override
  void onInit() {
    fatchBrands();
    super.onInit();
  }

  //featch all brands
  Future<void> fatchBrands() async {
    try {
      // start loader
      loader.value = true;

      // fatch all categories
      final banners = await _brandRepository.getBrands();

      // update allCategories
      allBrands.assignAll(banners);

      //update featured categories
      featuredBrands.assignAll(banners.where((element) => element.isFeatured));

      // stop loader
      loader.value = false;
    } catch (e) {
      AppPopups.showErrorSnackBar(title: "oh oops", message: e.toString());
    } finally {
      //stop loader
      loader.value = false;
    }
  }

  //set current brand
  Future<void> setCurrentBrand(BrandModel brand) async {
    currentBrand.value = brand;
  }
}
