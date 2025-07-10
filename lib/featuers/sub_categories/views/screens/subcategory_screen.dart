import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/featuers/products.dart/views/screens/all_products_screen.dart';
import '../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../common/widgets/cards/product_item_horizontal_card.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/titles/custome_title.dart';
import '../../../../data/controllers/banners/banner_controller.dart';
import '../../../../data/controllers/cart/cart_controller.dart';
import '../../../../data/controllers/favorites/favorites_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../data/models/products/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rand = Random();
    int randnum = rand.nextInt(6);
    ProductController productController = Get.find();
    final bannersController = Get.put(BannerController());
    final favoritesController = Get.put(FavoritesController());
    CartController cartController = Get.find();

    final currentCategory = productController.currentCategory;
    final productsAccoridingToTyp = productController.productsAccoridingToTyp;

    return Scaffold(
      //! -----> app bar
      appBar: CustomeAppBar(title: Text(currentCategory.value.name), padding: EdgeInsets.zero, showBackArrow: true),

      //! -----> body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Column(
          children: [
            //! -----> header bannar image
            RoundedImage(
              imageUrl: bannersController.allBanners[randnum].imageUrl,
              width: HelperFunctions.getScreenWidth(),
              height: 175,
              fit: BoxFit.fill,
              margin: EdgeInsets.zero,
              isNetworkImage: true,
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            //! -----> header title

            Obx(() {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: HelperFunctions.getScreenWidth(),
                  maxHeight: productsAccoridingToTyp.length * 200,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productsAccoridingToTyp.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomeTitle(
                          title: productsAccoridingToTyp.keys.toList()[index],
                          trailing: TextButton(
                              onPressed: () {
                                Get.to(() => AllProductsScreen(
                                      title: productsAccoridingToTyp.keys.toList()[index],
                                      productsAttribute: productsAccoridingToTyp.values.toList()[index],
                                    ));
                              },
                              child: const Text(AppTexts.viewAll)),
                          padding: EdgeInsets.zero,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: AppSizes.sm, horizontal: AppSizes.md),
                          width: HelperFunctions.getScreenWidth(),
                          height: AppSizes.productImageSize + 2,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: (productsAccoridingToTyp.values.toList()[index] as List).length < 2 ? 1 : 2,
                            itemBuilder: (context, index) {
                              List<Product> data = productsAccoridingToTyp.values.toList()[index];
                              return ProductItemHorizontalCard(
                                productId: data[index].id,
                                onTap: () async {
                                  await productController.setCurrentProduct(data[index]);
                                },
                                onFavoritButtonTab: () {
                                  favoritesController.toggleFavoritProduct(data[index]);
                                },
                                onAddToCart: () {
                                  cartController.addItemWithDefaultVariations(data[index]);
                                },
                                isNetworkImage: true,
                                imageUrl: data[index].images.first,
                                canceledPrice: data[index].price.toString(),
                                firstPrice: data[index].salePrice.toString(),
                                discription: data[index].description,
                                brand: data[index].brand.name,
                                topRightIcon: favoritesController.isFavorit(data[index].id) ? Iconsax.heart5 : Iconsax.heart,
                                saleText: 25.toString(),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
