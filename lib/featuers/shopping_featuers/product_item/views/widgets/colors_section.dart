import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/variation/variation_controller.dart';
import '../../../../../common/widgets/chips/circuler_chip.dart';
import '../../../../../common/widgets/titles/custome_title.dart';
import '../../../../../common/widgets/wrapping/wrapped_widget.dart';
import '../../../../../utils/constants/sizes.dart';

class ColorsSection extends StatelessWidget {
  const ColorsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final variationController = Get.put(VariationController());
    final productColors = variationController.productColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSizes.md),
        const CustomeTitle(
          title: "Colors",
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: AppSizes.md),
        ),

        //! -----> colors choices

        WrapedWidgets(
          itemCount: productColors.length,
          generator: (index) => Obx(
            () => CirculerChip(
              color: productColors[index],
              selected: variationController.selectedAttributes.value.color == productColors[index],
              onSelected: (v) {
                variationController.onAttributeSelected("color", productColors[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
