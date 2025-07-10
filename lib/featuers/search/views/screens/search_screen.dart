import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/featuers/store/views/widgets/search_textfield.dart';
import 'package:ushop/utils/constants/sizes.dart';
import '../../../../common/views_builder/products_gridview.dart';
import '../../../../common/widgets/cards/vertical_product_card.dart';
import '../../../../data/controllers/cart/cart_controller.dart';
import '../../../../data/controllers/favorites/favorites_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = ProductController.instance;
    final favoritesController = Get.put(FavoritesController());
    final cartController = Get.put(CartController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            const SearchTextField(),

            //expanded to take the rest of the screen
            Expanded(
              child: Obx(() {
                if (controller.loader.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.searchProducts.isEmpty) {
                  return const Center(
                    child: Text("No products found"),
                  );
                } //if there is no product in the search
                else {
                  final products = controller.searchProducts;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                    child: ProductsGridView(
                      itemCount: controller.searchProducts.length,
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
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
