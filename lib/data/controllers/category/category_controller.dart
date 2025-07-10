import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/products/products_controller.dart';
import 'package:ushop/data/models/products/product_model.dart';

import '../../../utils/popups/app_popups.dart';
import '../../models/category/category_model.dart';
import '../../repositories/category_repository/category_repository.dart';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  // instance creator
  static CategoryController get instance => Get.find();

  //category repository instance
  Rx<bool> loader = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final _categoryRepository = Get.put(CategoryRepository());

  //tab controller
  late TabController tabController;

  //on init method
  @override
  void onInit() async {
    await fatchCategories();
    tabController = TabController(length: featuredCategories.length, vsync: this);
    super.onInit();
  }

  //fatch all categories
  Future<void> fatchCategories() async {
    try {
      // start loader
      loader.value = true;
      // fatch all categories
      final categories = await _categoryRepository.getCategories();
      // update allCategories
      allCategories.assignAll(categories);

      //update featured categories
      featuredCategories.assignAll(categories.where((element) => element.isFeatured));
      // stop loader
      loader.value = false;
    } catch (e) {
      AppPopups.showErrorSnackBar(title: "oh oops", message: e.toString());
    } finally {
      //stop loader
      loader.value = false;
    }
  }

  //fatch categories according to id
  Map<String, List<Product>> fatchFeaturedCategorysAndItsProductsById() {
    final productController = Get.find<ProductController>();
    Map<String, List<Product>> data = {};

    for (var i = 0; i < featuredCategories.length; i++) {
      final products = productController.getProductsAccoringtocategoryId(featuredCategories[i].id);
      data[featuredCategories[i].id] = List<Product>.from(products);
    }
    return data;
  }

  //get category name by id
  String getCategoryNameById(String id) {
    final category = featuredCategories.firstWhere((element) => element.id == id);
    return category.name;
  }
}
