import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class StarsRatingIndicator extends StatelessWidget {
  const StarsRatingIndicator({
    super.key,
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, index) => const Icon(Iconsax.star1, color: AppColors.primary),
      itemSize: 20,
      unratedColor: AppColors.grey,
      rating: rating,
    );
  }
}
