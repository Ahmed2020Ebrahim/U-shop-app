import 'package:flutter/material.dart';

import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class BranndNameWithBlueSign extends StatelessWidget {
  const BranndNameWithBlueSign({
    super.key,
    required this.brandName,
    this.brandNameTextStyle,
  });

  final String brandName;
  final TextStyle? brandNameTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          brandName,
          style: brandNameTextStyle ?? Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(width: AppSizes.sm - 2),
        const Image(
          image: AssetImage(AppImages.verifiedIcon),
          width: 15,
        ),
      ],
    );
  }
}
