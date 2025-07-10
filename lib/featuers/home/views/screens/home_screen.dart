import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import 'package:ushop/data/controllers/favorites/favorites_controller.dart';
import '../../../../common/views_builder/products_gridview.dart';
import '../../../../common/widgets/cards/vertical_product_card.dart';
import '../../../../common/widgets/titles/custome_title.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../products.dart/views/screens/all_products_screen.dart';
import '../widgets/bannar_images_view.dart';
import '../widgets/edged_home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();
    final favoritesController = Get.put(FavoritesController());
    final cartController = Get.put(CartController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! ----- HEADER (USER NAME TITLE, BAG BUTTON, SEARCH BAR , CATEGORIES) -----
            const EdgedHeader(),

            //! ----- HOME BANNARS -----
            const BannarImagesView(),

            //! ----- POPULARE PRODUCT TITLE
            CustomeTitle(
              title: "Popular Products",
              trailing: TextButton(
                  onPressed: () {
                    Get.to(() => const AllProductsScreen());
                  },
                  child: const Text(AppTexts.viewAll)),
              padding: const EdgeInsets.only(top: AppSizes.spaceBtwSections, left: AppSizes.md, right: AppSizes.md),
            ),

            //! ----- PRODUCTS LISTVIEW ------
            Obx(() {
              if (controller.loader.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final products = controller.allProducts;
                return ProductsGridView(
                  // itemCount: controller.featuredProducts.length,
                  itemCount: products.length,
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
