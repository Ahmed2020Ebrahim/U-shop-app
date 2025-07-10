import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../buttons/favorit_button.dart';
import '../titles/verified_brand.dart';
import 'vertical_cart_add_to_cart_button.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.brandName,
    required this.firstPrice,
    this.sale,
    this.isFavorite = false,
    this.oldPrice,
    this.secondPrice,
    this.onTap,
    required this.productId,
    this.onFavoritButtonTab,
    this.onAddToCart,
  });

  final String productId;
  final String image;
  final double? sale;
  final bool isFavorite;
  final String title;
  final String brandName;
  final double? oldPrice;
  final double firstPrice;
  final double? secondPrice;
  final void Function()? onTap;
  final void Function()? onFavoritButtonTab;
  final void Function()? onAddToCart;

  @override
  Widget build(BuildContext context) {
    bool isdark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isdark ? AppColors.bgDark : AppColors.light,
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //! --- header container ----
            Container(
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                image: DecorationImage(image: CachedNetworkImageProvider(image), fit: BoxFit.fill),
                color: isdark ? AppColors.dark : AppColors.softGrey,
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              ),
              width: double.infinity,
              height: 150,
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sale == null
                        ? const SizedBox()
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(AppSizes.sm),
                            ),
                            child: Text(
                              "25%",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.dark),
                            ),
                          ),
                    FavoritButton(
                      productId: productId,
                      onfavoritButtonTab: onFavoritButtonTab,
                    ),
                  ],
                ),
              ),
            ),

            //! ---- middle container------
            Container(
              padding: const EdgeInsets.only(right: AppSizes.sm, left: AppSizes.sm, top: AppSizes.sm),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(title, style: Theme.of(context).textTheme.labelLarge, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ),
                  VerifiedBrand(brandName: brandName),
                ],
              ),
            ),

            //! ---- bottom container----
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(left: AppSizes.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! --- canceled price ---

                      oldPrice == null
                          ? const SizedBox()
                          : Text(
                              "35.0 ",
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(decoration: TextDecoration.lineThrough, color: AppColors.darkGrey),
                            ),

                      SizedBox(
                        width: 110,
                        child: Row(
                          children: [
                            //!---- first price -----
                            Flexible(flex: 1, child: FittedBox(child: Text("\$$firstPrice"))),
                            secondPrice == null ? const SizedBox() : const Flexible(flex: 1, child: FittedBox(child: Text(" - "))),
                            //! ---- second price ---
                            secondPrice == null ? const SizedBox() : Flexible(flex: 1, child: FittedBox(child: Text("\$$secondPrice"))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  VerticalCartAddToCartButton(productId: productId, onAddToCart: onAddToCart),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
