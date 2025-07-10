import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/common/widgets/bars/nested_custom_appbar.dart';
import 'package:ushop/data/models/products/product_model.dart';
import 'package:ushop/utils/constants/colors.dart';
import 'package:ushop/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../common/widgets/buttons/item_numbers_bag_button.dart';
import '../../../../data/controllers/cart/cart_controller.dart';
import '../../../../data/controllers/category/category_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shopping_featuers/items_cart/views/screens/items_cart_screen.dart';
import '../widgets/store_categories_tabview.dart';
import '../widgets/store_search_appbar.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  CategoryController categoryController = Get.find();
  final cartController = Get.put(CartController());
  final productcontroller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Product>> categoryProducts = categoryController.fatchFeaturedCategorysAndItsProductsById();
    bool isDark = HelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categoryProducts.length,
      child: Scaffold(
        appBar: CustomeAppBar(
          backgroundColor: isDark ? AppColors.dark : AppColors.lightContainer,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          title: const Text("Store"),
          actions: [
            Obx(
              () => ItemsNumberBagButton(
                iconColor: isDark ? AppColors.white : AppColors.black, // Change icon color based on theme
                cartItemsNumber: cartController.cartItemsNumber.value,
                onTap: () {
                  Get.to(() => const ItemsCartScreen());
                },
              ),
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, isScrolled) {
            return [
              const StoreSearchAppBar(
                bottom: NestedCustomAppBar(),
              ),
            ];
          },
          body: TabBarView(
            controller: categoryController.tabController,
            children: categoryProducts.keys.toList().map((id) {
              return StoreCategorysTabView(
                key: UniqueKey(),
                products: List<Product>.from(categoryProducts[id] ?? []),
                categoryName: categoryController.getCategoryNameById(id),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
