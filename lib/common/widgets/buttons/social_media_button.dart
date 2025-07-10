import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.onTap,
    required this.child,
  });
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.grey)),
        padding: const EdgeInsets.all(AppSizes.borderRadiusLg),
        width: 50,
        height: 50,
        child: child,
      ),
    );
  }
}
