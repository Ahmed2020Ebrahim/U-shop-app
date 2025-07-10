import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductDescriptionsSection extends StatelessWidget {
  const ProductDescriptionsSection({
    super.key,
    this.onShareIconTap,
    this.rate,
    this.voteNumbers,
    this.sale,
    this.firstPrice,
    this.secondPrice,
    this.description,
    this.stoke,
    this.brandImage,
    this.brandName,
  });
  final VoidCallback? onShareIconTap;
  final double? rate;
  final int? voteNumbers;
  final double? sale;
  final double? firstPrice;
  final double? secondPrice;
  final String? description;
  final String? stoke;
  final String? brandImage;
  final String? brandName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: GestureDetector(
            child: const Icon(
              Iconsax.star1,
              color: AppColors.secondary,
            ),
          ),
          trailing: IconButton(
            onPressed: onShareIconTap,
            icon: const Icon(Icons.share),
          ),
          horizontalTitleGap: 5,
          dense: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (rate != null)
                Text(
                  rate.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              if (voteNumbers != null)
                Text(
                  " ($voteNumbers)",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
            ],
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: sale != null
              ? Container(
                  width: 45,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
                  ),
                  child: Text('$sale%'),
                )
              : null,
          dense: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (firstPrice != null)
                Text(
                  "\$$firstPrice",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              if (secondPrice != null)
                Text(
                  " - \$$secondPrice",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
            ],
          ),
        ),
        if (description != null)
          Text(
            description!,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "stoke:  ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                if (stoke != null) TextSpan(text: stoke, style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (brandImage != null)
              Image(
                width: AppSizes.iconMd,
                height: AppSizes.iconMd,
                image: AssetImage(brandImage!),
              ),
            const SizedBox(width: AppSizes.sm),
            if (brandName != null) Text(brandName!),
            const SizedBox(width: AppSizes.sm),
            Container(
              alignment: Alignment.center,
              width: AppSizes.md,
              height: AppSizes.md,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.check,
                size: AppSizes.md - 2,
                color: AppColors.light,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
