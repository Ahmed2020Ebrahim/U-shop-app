import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/favorites/favorites_controller.dart';
import 'package:ushop/data/controllers/products/products_controller.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../common/custom_shapes/bottom_edget_clipper.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../common/widgets/buttons/favorit_button.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductDetailsImagesDisplayer extends StatelessWidget {
  const ProductDetailsImagesDisplayer({
    required this.images,
    super.key,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    final ProductController controller = Get.find();
    final FavoritesController favoritesController = Get.put(FavoritesController());
    return ClipPath(
      clipper: BottomEadgedClipper(),
      child: Container(
        decoration: BoxDecoration(color: isDark ? AppColors.darkerGrey : AppColors.grey),
        child: Stack(
          children: [
            Container(
              color: isDark ? AppColors.darkerGrey : AppColors.grey,
              width: HelperFunctions.getScreenWidth(),
              height: HelperFunctions.getScreenHeight() * 0.42,
              child: CachedNetworkImage(
                imageUrl: images[0],
                fit: BoxFit.fill,
                placeholder: (context, url) => const LoadingShimmer(width: double.infinity, height: double.infinity),
                errorWidget: (context, url, error) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Icon(Icons.error), Text("image can't be showen")],
                ),
              ),
            ),
            Positioned(
              top: 0,
              width: HelperFunctions.getScreenWidth(),
              child: CustomeAppBar(
                backArrowColor: AppColors.grey,
                showBackArrow: true,
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Material(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(50),
                      child: FavoritButton(
                        productId: controller.currentProduct.value.id,
                        onfavoritButtonTab: () {
                          favoritesController.toggleFavoritProduct(controller.currentProduct.value);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              child: Container(
                height: AppSizes.imageThumbSize,
                width: HelperFunctions.getScreenWidth(),
                alignment: Alignment.center,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: images.length == 1
                      ? []
                      : [
                          ...List.generate(
                            images.length,
                            (index) => RoundedContainer(
                              margin: const EdgeInsets.all(AppSizes.sm),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.black : AppColors.lightGrey,
                                border: Border.all(color: AppColors.primary),
                                borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                              ),
                              width: AppSizes.imageThumbSize - 15,
                              height: AppSizes.imageThumbSize - 10,
                              child: Image(
                                image: AssetImage(
                                  images[index],
                                ),
                              ),
                            ),
                          ),
                        ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.xl,
            )
          ],
        ),
      ),
    );
  }
}
