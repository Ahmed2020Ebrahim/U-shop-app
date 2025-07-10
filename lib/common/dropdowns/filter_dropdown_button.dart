import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/controllers/products/products_controller.dart';
import '../../utils/constants/sizes.dart';

class FilterDropDownButton extends StatelessWidget {
  const FilterDropDownButton({
    this.forAllProducts = false,
    super.key,
  });

  final bool forAllProducts;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        items: controller.sortingValues
            .map(
              (e) => DropdownMenuItem(
                value: e,
                onTap: () {
                  controller.initialSortingValue.value = e;
                },
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) async {
          await controller.reOrderProducts(value!, forAllProducts);
        },
        value: controller.initialSortingValue.value,
      ),
    );
  }
}
