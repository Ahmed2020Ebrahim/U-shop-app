import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    required this.onTap,
    super.key,
    this.backgroundColor = AppColors.light,
    this.borderColor = AppColors.light,
  });
  final Color? backgroundColor;
  final Color? borderColor;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: Border.all(color: borderColor ?? AppColors.light),
            color: backgroundColor,
          ),
          child: const Row(
            children: [
              Icon(
                Iconsax.search_normal,
                color: AppColors.darkGrey,
              ),
              SizedBox(width: AppSizes.spaceBtwInputFields),
              Text(
                AppTexts.customeSearchBarDefaultLebelText,
                style: TextStyle(color: AppColors.darkGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
