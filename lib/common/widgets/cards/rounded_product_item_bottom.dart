import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../brand/brannd_name_with_blue_sign.dart';

class RoundedProductItemBottom extends StatelessWidget {
  const RoundedProductItemBottom({
    super.key,
    required this.productId,
    required this.productDiscription,
    required this.brand,
    this.canceledPrice,
    required this.firstPrice,
    this.secondPrice,
    this.onAddButtonTap,
  });
  final String productId;
  final String productDiscription;
  final String brand;
  final String? canceledPrice;
  final String firstPrice;
  final String? secondPrice;
  final VoidCallback? onAddButtonTap;

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: -1,
          child: Obx(
            () => GestureDetector(
              onTap: onAddButtonTap,
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(AppSizes.cardRadiusLg),
                    topLeft: Radius.circular(AppSizes.cardRadiusLg),
                  ),
                  color: cartController.isProductExist(productId) ? AppColors.success : AppColors.primary,
                ),
                child: cartController.isProductExist(productId)
                    ? Text(
                        cartController.getAddedItemsNumber(productId).toString(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.white),
                      )
                    : const Icon(
                        Iconsax.add,
                        color: AppColors.light,
                        size: AppSizes.iconLg,
                      ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: AppSizes.md, left: AppSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 145,
                  child: Text(
                    productDiscription,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.sm),
              BranndNameWithBlueSign(brandName: brand),
              const SizedBox(height: AppSizes.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  canceledPrice != null
                      ? SizedBox(
                          height: AppSizes.md,
                          child: Text(
                            "\$$canceledPrice",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        )
                      : const SizedBox(
                          height: AppSizes.md,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$$firstPrice",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(width: AppSizes.sm),
                          if (secondPrice != null) ...[
                            const Text("-"),
                            const SizedBox(width: AppSizes.sm),
                            Text(
                              "\$$secondPrice",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ]
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
