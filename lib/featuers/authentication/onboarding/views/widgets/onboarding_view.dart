import 'package:flutter/material.dart';

import '../../../../../common/widgets/screens/vertical_spaced_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return VerticalSpacedScreen(
      spaces: const [80, 15],
      children: [
        Image(image: AssetImage(image)),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 90),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
