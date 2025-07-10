import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brannd_name_with_blue_sign.dart';

class BranndCard extends StatelessWidget {
  const BranndCard({
    required this.branndImageUrl,
    required this.brandName,
    this.onTap,
    this.isNetworkImage = false,
    this.itemsNumbers,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 200,
    super.key,
  });
  final String branndImageUrl;
  final String brandName;
  final bool? isNetworkImage;
  final int? itemsNumbers;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.md),
          border: Border.all(
            color: isDark ? AppColors.light : AppColors.grey,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: AppSizes.md, right: AppSizes.sm),
              height: 40,
              width: 40,
              child: Image(
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Column(
                    children: [
                      Icon(Icons.error),
                      FittedBox(child: Text("Can't get image")),
                    ],
                  ),
                ),
                image: AssetImage(branndImageUrl),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(child: BranndNameWithBlueSign(brandName: brandName, brandNameTextStyle: Theme.of(context).textTheme.titleLarge)),
                  Flexible(
                    child: itemsNumbers == null
                        ? const SizedBox()
                        : Text(
                            '$itemsNumbers ${AppTexts.products}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 10),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
