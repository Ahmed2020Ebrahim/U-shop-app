import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class VerifiedBrand extends StatelessWidget {
  const VerifiedBrand({
    super.key,
    required this.brandName,
    this.style,
  });

  final String brandName;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: FittedBox(
            child: Text(
              brandName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: style ?? Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.darkGrey),
            ),
          ),
        ),
        const SizedBox(width: AppSizes.sm),
        const Image(
          image: AssetImage(AppImages.verifiedIcon),
          width: 15,
        ),
      ],
    );
  }
}
