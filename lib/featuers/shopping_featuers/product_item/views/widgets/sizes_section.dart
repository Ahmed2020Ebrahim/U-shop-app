import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/titles/custome_title.dart';
import '../../../../../common/widgets/wrapping/wrapped_widget.dart';
import '../../../../../data/controllers/variation/variation_controller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SizesSections extends StatelessWidget {
  const SizesSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final variationController = Get.put(VariationController());
    final productSizes = variationController.productSizes;
    bool isDark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSizes.md),
        const CustomeTitle(
          title: "Sizes",
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: AppSizes.md),
        ),

        //! -----> sizes choices
        WrapedWidgets(
          itemCount: productSizes.length,
          generator: (index) => SizedBox(
            height: 50,
            width: 60,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Obx(
                () => ChoiceChip(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.sm, horizontal: AppSizes.md),
                  label: Text(
                    productSizes[index],
                    style: Theme.of(context).textTheme.titleMedium!.apply(color: isDark ? AppColors.light : AppColors.black),
                  ),
                  selected: variationController.selectedAttributes.value.size == productSizes[index],
                  onSelected: (v) {
                    variationController.onAttributeSelected("size", productSizes[index]);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
