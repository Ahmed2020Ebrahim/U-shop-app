import 'package:flutter/material.dart';

import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);

    return Center(
      child: Column(
        children: [
          Image(
            image: AssetImage(isDark ? AppImages.appLogoLight : AppImages.appLogoDark),
            width: AppSizes.productImageHeight,
          ),
          Text(
            AppTexts.welcom,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          const Text(AppTexts.welcomSubtite),
        ],
      ),
    );
  }
}
