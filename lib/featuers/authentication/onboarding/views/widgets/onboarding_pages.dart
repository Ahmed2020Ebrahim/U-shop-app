import "package:flutter/material.dart";
import "../../../../../utils/constants/images.dart";
import "../../../../../utils/constants/texts.dart";
import "../../controllers/onboard_controller.dart";
import "onboarding_view.dart";

class OnboardingPages extends StatelessWidget {
  const OnboardingPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: OnBoardController.instansce.pageViewController,
      onPageChanged: OnBoardController.instansce.updateCurrentPage,
      children: const [
        OnBoardingView(
          image: AppImages.onBoardingImage1,
          title: AppTexts.onBoardingTitle1,
          subtitle: AppTexts.onBoardingSubTitle1,
        ),
        OnBoardingView(
          image: AppImages.onBoardingImage2,
          title: AppTexts.onBoardingTitle2,
          subtitle: AppTexts.onBoardingSubTitle2,
        ),
        OnBoardingView(
          image: AppImages.onBoardingImage3,
          title: AppTexts.onBoardingTitle3,
          subtitle: AppTexts.onBoardingSubTitle3,
        ),
      ],
    );
  }
}
