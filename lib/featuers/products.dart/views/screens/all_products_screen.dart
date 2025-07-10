import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/models/products/product_model.dart';
import '../../../../common/dropdowns/filter_dropdown_button.dart';
import '../../../../common/views_builder/products_gridview.dart';
import '../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../common/widgets/cards/vertical_product_card.dart';
import '../../../../data/controllers/cart/cart_controller.dart';
import '../../../../data/controllers/favorites/favorites_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/sizes.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, this.productsAttribute, this.title});

  final List<Product>? productsAttribute;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    final favoritesController = Get.put(FavoritesController());
    final cartController = Get.put(CartController());
    return Scaffold(
      //! -----> app bar
      appBar: CustomeAppBar(title: Text(title ?? 'All Products'), showBackArrow: true, padding: EdgeInsets.zero),

      //! -----> body
      body: SingleChildScrollView(
        child: Column(
          children: [
            title == null ? const FilterDropDownButton(forAllProducts: true) : const SizedBox(),
            const SizedBox(height: AppSizes.md),
            Obx(() {
              if (controller.loader.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final products = productsAttribute ?? controller.allProducts;
                return ProductsGridView(
                  itemCount: productsAttribute != null ? productsAttribute!.length : products.length,
                  itemBuilder: (context, index) => VerticalProductCard(
                    onTap: () async {
                      await controller.setCurrentProduct(products[index]);
                    },
                    onFavoritButtonTab: () {
                      favoritesController.toggleFavoritProduct(products[index]);
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
