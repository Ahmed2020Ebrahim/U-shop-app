import 'package:flutter/material.dart';

import '../widgets/next_page_button.dart';
import '../widgets/onboarding_indecators.dart';
import '../widgets/onboarding_pages.dart';
import '../widgets/skip_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          OnboardingPages(),
          SkipButton(),
          NextPageButton(),
          OnboardingIndecators(),
        ],
      ),
    );
  }
}
