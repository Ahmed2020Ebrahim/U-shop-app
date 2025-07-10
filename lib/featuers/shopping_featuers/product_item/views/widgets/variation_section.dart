import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class VariationSection extends StatelessWidget {
  const VariationSection({
    super.key,
    required this.price,
    required this.salePrice,
    required this.description,
  });
  final double price;
  final double salePrice;
  final String description;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.spaceBtwItems),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        color: isDark ? AppColors.darkerGrey : AppColors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Variation : ", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Price : ", style: Theme.of(context).textTheme.labelSmall),
                      Text("\$ $price", style: Theme.of(context).textTheme.labelSmall!.copyWith(decoration: TextDecoration.lineThrough)),
                      Text(" - \$ $salePrice", style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Stock : ", style: Theme.of(context).textTheme.labelSmall),
                      Text("In Stock", style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
          Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          )
        ],
      ),
    );
  }
}
