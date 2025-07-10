import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      width: double.infinity,
      child: OutlinedButton(
        style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
              side: const WidgetStatePropertyAll(
                BorderSide(color: AppColors.darkGrey),
              ),
            ),
        onPressed: onTap ?? () {},
        child: const Text(AppTexts.logOut),
      ),
    );
  }
}
