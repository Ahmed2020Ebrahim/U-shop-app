import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ItemsNumberBagButton extends StatelessWidget {
  const ItemsNumberBagButton({
    required this.onTap,
    this.iconColor,
    super.key,
    required this.cartItemsNumber,
  });
  final void Function()? onTap;
  final Color? iconColor;
  final int cartItemsNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.sm),
      child: Stack(
        children: [
          IconButton(
            onPressed: onTap,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor ?? AppColors.light,
            ),
          ),
          Positioned(
            right: 0,
            child: CircleAvatar(
              backgroundColor: AppColors.dark,
              radius: 10,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    cartItemsNumber.toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.light, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
