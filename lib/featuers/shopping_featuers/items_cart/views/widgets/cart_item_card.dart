import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/brand/brannd_name_with_blue_sign.dart';
import '../../../../../common/widgets/containers/circuler_container.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.imageUrl,
    this.brandName,
    this.description,
    this.colorText,
    this.numberOfPices = 0,
    this.totalAmount = 0.0,
    this.showAddRemoveButtons = true,
    this.showSmallSizeAndTotal = false,
    this.size,
    this.onIncreasTap,
    this.onDecreasTap,
  });
  final String imageUrl;
  final String? brandName;
  final String? description;
  final String? colorText;
  final String? size;
  final int? numberOfPices;
  final double? totalAmount;
  final bool? showAddRemoveButtons;
  final bool? showSmallSizeAndTotal;
  final void Function()? onIncreasTap;
  final void Function()? onDecreasTap;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwSections),
      padding: const EdgeInsets.only(right: AppSizes.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! -----> image column
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RoundedContainer(
                width: 60,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd), color: AppColors.grey),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fill, width: 60, height: 60),
                ),
              ),
            ],
          ),
          const SizedBox(width: AppSizes.md),

          //! -----> details column
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! -----> brand
                BranndNameWithBlueSign(brandName: brandName ?? "Unknowen brand"),

                //! -----> description
                Text(description != null ? description! : "", style: Theme.of(context).textTheme.titleSmall),

                //! -----> color , sizes , pices number , total price
                FittedBox(
                  child: Wrap(
                    children: [
                      if (colorText != null)
                        Text.rich(TextSpan(
                          text: "Color: ",
                          style: Theme.of(context).textTheme.labelMedium,
                          children: [TextSpan(text: colorText, style: Theme.of(context).textTheme.labelLarge)],
                        )),
                      if (colorText != null) const SizedBox(width: AppSizes.sm),
                      if (size != null)
                        Text.rich(TextSpan(
                          text: "Size: ",
                          style: Theme.of(context).textTheme.labelMedium,
                          children: [TextSpan(text: size, style: Theme.of(context).textTheme.labelLarge)],
                        )),
                      if (size != null) const SizedBox(width: AppSizes.sm),
                      if (numberOfPices != null && showSmallSizeAndTotal == true)
                        Text.rich(TextSpan(
                          text: "pices: ",
                          style: Theme.of(context).textTheme.labelMedium,
                          children: [TextSpan(text: numberOfPices.toString(), style: Theme.of(context).textTheme.labelLarge)],
                        )),
                      if (numberOfPices != null) const SizedBox(width: AppSizes.sm),
                      if (totalAmount != null && showSmallSizeAndTotal == true)
                        Text.rich(TextSpan(
                          text: "total: \$",
                          style: Theme.of(context).textTheme.labelMedium,
                          children: [TextSpan(text: totalAmount.toString(), style: Theme.of(context).textTheme.labelLarge)],
                        )),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.sm),

                //! -----> increase and decrease buttons
                if (showAddRemoveButtons!)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onDecreasTap,
                            child: CircularContainer(
                              width: 30,
                              height: 30,
                              backgorundColor: isDark ? AppColors.darkGrey : AppColors.grey,
                              alignment: Alignment.center,
                              opacity: 1,
                              child: const Icon(Iconsax.minus),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: AppSizes.md), child: Text(numberOfPices.toString(), style: Theme.of(context).textTheme.titleLarge)),
                          GestureDetector(
                            onTap: onIncreasTap,
                            child: const CircularContainer(
                              width: 30,
                              height: 30,
                              backgorundColor: AppColors.primary,
                              alignment: Alignment.center,
                              opacity: 1,
                              child: Icon(
                                Iconsax.add,
                                color: AppColors.light,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text("\$$totalAmount", style: Theme.of(context).textTheme.titleLarge)
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
