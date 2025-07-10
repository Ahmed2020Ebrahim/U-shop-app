import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../controllers/onboard_controller.dart';

class OnboardingIndecators extends StatelessWidget {
  const OnboardingIndecators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return Positioned(
      left: AppSizes.defaultSpace,
      bottom: HelperFunctions.getBottomNavigationBarHeight() + 20,
      child: SmoothPageIndicator(
        controller: OnBoardController.instansce.pageViewController,
        onDotClicked: OnBoardController.instansce.indecatorScrolle,
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: isDark ? AppColors.light : AppColors.dark, dotHeight: 6),
      ),
    );
  }
}
