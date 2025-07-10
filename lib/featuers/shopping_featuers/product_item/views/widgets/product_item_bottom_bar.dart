import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/variation/variation_controller.dart';

import '../../../../../common/widgets/containers/circuler_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductItemBottomBar extends StatelessWidget {
  const ProductItemBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final variationController = Get.put(VariationController());
    bool isDark = HelperFunctions.isDarkMode(context);
    return Expanded(
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          height: 75,
          width: HelperFunctions.getScreenWidth(),
          color: isDark ? AppColors.darkerGrey : AppColors.grey,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  variationController.onDecreaseItem();
                },
                child: const CircularContainer(
                  margin: 8,
                  opacity: 1,
                  width: 30,
                  height: 30,
                  backgorundColor: AppColors.darkGrey,
                  child: Icon(Iconsax.minus, color: AppColors.white),
                ),
              ),
              Text(
                variationController.currentCartItem.value.quantity.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              GestureDetector(
                onTap: () {
                  variationController.onIncreaseItem();
                },
                child: const CircularContainer(
                  margin: 8,
                  width: 30,
                  height: 30,
                  backgorundColor: AppColors.black,
                  opacity: 1,
                  child: Icon(Iconsax.add, color: AppColors.white),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  variationController.addToCart();
                },
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                  decoration: BoxDecoration(
                    color: variationController.currentCartItem.value.quantity == 0 ? Colors.transparent : AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Iconsax.shopping_bag,
                        color: isDark ? AppColors.grey : AppColors.white,
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        "Add to Bag",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: isDark ? AppColors.grey : AppColors.white,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
