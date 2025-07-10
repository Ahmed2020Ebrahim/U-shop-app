import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import 'package:ushop/data/controllers/favorites/favorites_controller.dart';

import '../../../../common/dropdowns/filter_dropdown_button.dart';
import '../../../../common/views_builder/products_gridview.dart';
import '../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../common/widgets/brand/brannd_card.dart';
import '../../../../common/widgets/cards/vertical_product_card.dart';
import '../../../../data/controllers/brands/brands_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SingleBrandProductsScreen extends StatelessWidget {
  const SingleBrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandContorller = Get.put(BrandsController());
    final productContrller = Get.put(ProductController());
    FavoritesController favoritController = Get.find();
    CartController cartController = Get.find();
    bool isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomeAppBar(
        showBackArrow: true,
        title: Text("Brand Name"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BranndCard(
              height: 80,
              margin: const EdgeInsets.all(AppSizes.md),
              branndImageUrl: isDark ? brandContorller.currentBrand.value.imageUrl : brandContorller.currentBrand.value.imageUrl.replaceAll("light", "dark"),
              brandName: brandContorller.currentBrand.value.name,
              itemsNumbers: brandContorller.currentBrand.value.productsCount,
            ),
            const SizedBox(height: AppSizes.lg),
            const FilterDropDownButton(),
            const SizedBox(height: AppSizes.md),
            Obx(() {
              if (productContrller.loader.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final products = productContrller.currentBrandProducts;
                return ProductsGridView(
                  itemCount: productContrller.currentBrandProducts.length,
                  itemBuilder: (context, index) => VerticalProductCard(
                    onTap: () async {
                      await productContrller.setCurrentProduct(products[index]);
                    },
                    onFavoritButtonTab: () {
                      favoritController.toggleFavoritProduct(products[index]);
                    },
                    onAddToCart: () {
                      cartController.addItemWithDefaultVariations(products[index]);
                    },
                    productId: products[index].id,
                    image: products[index].images.first,
                    title: products[index].description,
                    brandName: products[index].brand.name,
                    sale: 25,
                    firstPrice: products[index].salePrice,
                    oldPrice: products[index].salePrice,
                    secondPrice: products[index].price,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
