import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../controllers/onboard_controller.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: AppSizes.appBarHeight,
        right: AppSizes.defaultSpace,
        child: InkWell(
          onTap: () async => await OnBoardController.instansce.goNext(),
          child: CircleAvatar(
            backgroundColor: isDark ? AppColors.light : AppColors.black,
            radius: 30,
            child: Icon(
              Iconsax.arrow_right_3,
              size: 30,
              color: isDark ? AppColors.dark : AppColors.light,
            ),
          ),
        ));
  }
}
