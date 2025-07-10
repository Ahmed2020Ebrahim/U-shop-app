import 'package:flutter/material.dart';

import '../../../../../common/widgets/indecators/stars_reating_indecator.dart';

class RatingSummary extends StatelessWidget {
  const RatingSummary({
    super.key,
    required this.rating,
    this.votsNumber,
  });
  final double rating;
  final int? votsNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StarsRatingIndicator(rating: rating),
        if (votsNumber != null)
          Text(
            votsNumber.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
      ],
    );
  }
}
