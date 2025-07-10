import 'package:flutter/material.dart';
import 'package:ushop/data/controllers/products/products_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    ProductController controller = ProductController.instance;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
      child: TextField(
        onChanged: (value) {
          controller.search(value);
        },
        autofocus: true,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(Icons.search),
          fillColor: isDark ? AppColors.dark : AppColors.light,
          hintText: "Search for product",
        ),
      ),
    );
  }
}
