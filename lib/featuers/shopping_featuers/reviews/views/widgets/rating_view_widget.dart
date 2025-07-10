import 'package:flutter/material.dart';
import '../../../../../common/widgets/indecators/rating_progres_indecator.dart';
import '../../../../../utils/constants/sizes.dart';

class RatingViewWidget extends StatelessWidget {
  const RatingViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: Text('4.7', style: Theme.of(context).textTheme.displayLarge)),
          const SizedBox(width: AppSizes.spaceBtwSections),
          const Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RateingProgressIndicator(rate: 1, ratingDegree: 5),
                RateingProgressIndicator(rate: 0.8, ratingDegree: 4),
                RateingProgressIndicator(rate: 0.6, ratingDegree: 3),
                RateingProgressIndicator(rate: 0.4, ratingDegree: 2),
                RateingProgressIndicator(rate: 0.2, ratingDegree: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
