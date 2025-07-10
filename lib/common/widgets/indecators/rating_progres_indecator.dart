import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class RateingProgressIndicator extends StatelessWidget {
  const RateingProgressIndicator({
    super.key,
    this.ratingDegree,
    required this.rate,
  });
  final int? ratingDegree;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (ratingDegree != null) Expanded(flex: 1, child: Text(ratingDegree!.toString())),
        Expanded(
          flex: 11,
          child: LinearProgressIndicator(
            backgroundColor: AppColors.grey,
            value: rate,
            minHeight: 10,
            valueColor: const AlwaysStoppedAnimation(AppColors.primary),
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
          ),
        ),
      ],
    );
  }
}
