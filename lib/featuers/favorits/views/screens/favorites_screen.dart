import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import 'package:ushop/data/controllers/favorites/favorites_controller.dart';
import 'package:ushop/routes/app_routs.dart';

import '../../../../common/views_builder/products_gridview.dart';
import '../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../common/widgets/cards/vertical_product_card.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/helpers/helper_functions.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setStatusBarBrightness(context);
    final favoritController = Get.put(FavoritesController());
    final ProductController productcontroller = Get.find();
    CartController cartController = Get.find();

    return Scaffold(
      appBar: CustomeAppBar(
        title: const Text("Favorites"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRouts.allProductsScreen);
              },
              icon: const Icon(Iconsax.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (favoritController.userFavoritProductsList.isEmpty) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: Get.height - 100 - 65,
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Favorits yet"),
                      ],
                    ),
                  ),
                ),
              );
            } else if (favoritController.userFavoritProductsList.isNotEmpty) {
              return ProductsGridView(
                itemCount: favoritController.userFavoritProductsList.length,
                itemBuilder: (context, index) => VerticalProductCard(
                  key: UniqueKey(),
                  onTap: () async {
                    await productcontroller.setCurrentProduct(productcontroller.getProductById(favoritController.userFavoritsProductsIdList.keys.toList()[index]));
                  },
                  onFavoritButtonTab: () {
                    favoritController.toggleFavoritProduct(favoritController.userFavoritProductsList[index]);
                  },
                  onAddToCart: () {
                    cartController.addItemWithDefaultVariations(favoritController.userFavoritProductsList[index]);
                  },
                  productId: favoritController.userFavoritProductsList[index].id,
                  image: favoritController.userFavoritProductsList[index].images[0],
                  title: favoritController.userFavoritProductsList[index].title,
                  brandName: favoritController.userFavoritProductsList[index].brand.name,
                  firstPrice: favoritController.userFavoritProductsList[index].price,
                ),
              );
            } else {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: Get.height - 100 - 56),
                child: const Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
        // Obx(
        //   () => FutureBuilder(
        //     future: favoritController.getFavoritProducts(),
        //     builder: (context, snapshot) {
        //       if (favoritController.userFavoritsProductsIdList.isNotEmpty) {
        //         return ProductsGridView(
        //           itemCount: favoritController.userFavoritsProductsIdList.length,
        //           itemBuilder: (context, index) => VerticalProductCard(
        //             key: UniqueKey(),
        //             onTap: () async {
        //               await productcontroller.setCurrentProduct(productcontroller.getProductById(favoritController.userFavoritsProductsIdList.keys.toList()[index]));
        //             },
        //             onFavoritButtonTab: () {
        //               favoritController.toggleFavoritProduct(favoritController.userFavoritsProductsIdList.keys.toList()[index]);
        //             },
        //             productId: snapshot.requireData[index].id,
        //             image: snapshot.requireData[index].images[0],
        //             title: snapshot.requireData[index].title,
        //             brandName: snapshot.requireData[index].brand.name,
        //             firstPrice: snapshot.requireData[index].price,
        //           ),
        //         );
        //       } else if (favoritController.userFavoritsProductsIdList.isEmpty) {
        //         return ConstrainedBox(
        //           constraints: BoxConstraints(
        //             minHeight: Get.height - 100 - 65,
        //           ),
        //           child: const Align(
        //             alignment: Alignment.center,
        //             child: Center(
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Text("No Favorits yet"),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       } else if (snapshot.hasError || snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
        //         return ConstrainedBox(
        //           constraints: BoxConstraints(minHeight: Get.height - 100 - 56),
        //           child: const Align(
        //             alignment: Alignment.center,
        //             child: Center(
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   CircularProgressIndicator(),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       } else {
        //         return const Text("");
        //       }
        //     },
        //   ),
        // ),
      ),
    );
  }
}
