import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/rounded_image.dart';
import 'brannd_name_with_blue_sign.dart';

class BranndCardWithRecomendations extends StatelessWidget {
  const BranndCardWithRecomendations({
    super.key,
    required this.branndImage,
    required this.branndName,
    this.itemsNumber,
    this.recomintationImages,
  });
  final String branndImage;
  final String branndName;
  final String? itemsNumber;

  final List<String>? recomintationImages;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.sm),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.md),
        border: Border.all(
          color: isDark ? AppColors.light : AppColors.dark,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(branndImage),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BranndNameWithBlueSign(
                    brandName: branndName,
                    brandNameTextStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (itemsNumber != null)
                    Text(
                      "$itemsNumber ${AppTexts.products} ",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (recomintationImages != null)
                ...List.generate(
                  recomintationImages!.length,
                  (index) => Flexible(
                    child: RoundedImage(
                      height: 35,
                      margin: const EdgeInsets.all(AppSizes.sm),
                      imageUrl: recomintationImages![index],
                      padding: const EdgeInsets.all(20),
                      backgroundColor: AppColors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
