import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/controllers/cart/cart_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class VerticalCartAddToCartButton extends StatelessWidget {
  const VerticalCartAddToCartButton({
    super.key,
    required this.productId,
    required this.onAddToCart,
  });

  final String productId;
  final void Function()? onAddToCart;

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();
    return Obx(
      () => Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: controller.isProductExist(productId) ? AppColors.success : AppColors.primary,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(AppSizes.cardRadiusLg),
            topLeft: Radius.circular(AppSizes.cardRadiusLg),
          ),
        ),
        child: IconButton(
          onPressed: onAddToCart,
          icon: controller.isProductExist(productId)
              ? Text(
                  controller.getAddedItemsNumber(productId).toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.white),
                )
              : const Icon(Iconsax.add, color: AppColors.light),
        ),
      ),
    );
  }
}
