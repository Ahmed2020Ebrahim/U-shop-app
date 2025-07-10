import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/models/products/product_model.dart';
import 'package:ushop/featuers/products.dart/views/screens/all_products_screen.dart';
import '../../../../common/views_builder/products_gridview.dart';
import '../../../../common/widgets/cards/vertical_product_card.dart';
import '../../../../common/widgets/titles/custome_title.dart';
import '../../../../data/controllers/cart/cart_controller.dart';
import '../../../../data/controllers/favorites/favorites_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class StoreCategorysTabView extends StatelessWidget {
  const StoreCategorysTabView({
    super.key,
    required this.products,
    required this.categoryName,
  });

  final List<Product> products;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();
    final favoritesController = Get.put(FavoritesController());
    final cartController = Get.put(CartController());

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(children: []),
        ),
        CustomeTitle(
          title: "You Might Like",
          trailing: TextButton(
              onPressed: () {
                //implement view all sports products action here
                Get.to(() => AllProductsScreen(
                      productsAttribute: products,
                      title: categoryName,
                    ));
              },
              child: const Text(AppTexts.viewAll)),
        ),
        ProductsGridView(
          itemCount: 6,
          itemBuilder: (context, index) {
            return VerticalProductCard(
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
              image: products[index].images[0],
              title: products[index].title,
              brandName: products[index].brand.name,
              sale: 25,
              firstPrice: products[index].salePrice,
              oldPrice: products[index].salePrice,
              secondPrice: products[index].price,
            );
          },
        ),
      ],
    );
  }
}
