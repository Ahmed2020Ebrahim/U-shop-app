import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../controllers/onboard_controller.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSizes.appBarHeight,
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: () async => await OnBoardController.instansce.onBoardingSkip(),
        child: const Text(AppTexts.onBoardingSkip),
      ),
    );
  }
}
