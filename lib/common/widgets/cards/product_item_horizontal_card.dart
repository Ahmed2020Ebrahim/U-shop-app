import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/favorites/favorites_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'rounded_product_item_bottom.dart';
import 'rounded_product_item_header.dart';

class ProductItemHorizontalCard extends StatelessWidget {
  const ProductItemHorizontalCard({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.firstPrice,
    required this.discription,
    required this.brand,
    this.topRightIcon = Iconsax.heart,
    this.saleText,
    this.canceledPrice,
    this.secondPrice,
    this.isNetworkImage = false,
    this.onTap,
    this.onFavoritButtonTab,
    this.onAddToCart,
  });

  final String productId;
  final String imageUrl;
  final String? saleText;
  final IconData? topRightIcon;
  final String discription;
  final String brand;
  final String firstPrice;
  final String? canceledPrice;
  final String? secondPrice;
  final bool? isNetworkImage;
  final VoidCallback? onTap;
  final void Function()? onFavoritButtonTab;
  final void Function()? onAddToCart;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    FavoritesController favoritesController = Get.find();

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: HelperFunctions.getScreenWidth() - 88,
        height: AppSizes.productImageSize,
        margin: const EdgeInsets.only(right: AppSizes.spaceBtwInputFields),
        decoration: BoxDecoration(color: isDark ? AppColors.darkerGrey : AppColors.light, borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg)),
        child: Row(
          children: [
            Obx(
              () => RoundedProductItemHeader(
                onTopRightIconTap: onFavoritButtonTab,
                imageUrl: imageUrl,
                saleText: saleText,
                topRightIcon: favoritesController.isFavorit(productId) ? Iconsax.heart5 : Iconsax.heart,
                topRightIconColor: favoritesController.isFavorit(productId) ? AppColors.error : AppColors.white,
                width: AppSizes.productImageSize,
                height: AppSizes.productItemHeight,
                isNetworkImage: isNetworkImage,
                isHorizontal: true,
              ),
            ),
            SizedBox(
              width: 150,
              child: RoundedProductItemBottom(
                productId: productId,
                productDiscription: discription,
                brand: brand,
                firstPrice: firstPrice,
                canceledPrice: canceledPrice,
                secondPrice: secondPrice,
                onAddButtonTap: onAddToCart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
