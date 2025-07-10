import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controllers/category/category_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class NestedCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const NestedCustomAppBar({
    super.key,
  });

  @override
  State<NestedCustomAppBar> createState() => _NestedCustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);
}

class _NestedCustomAppBarState extends State<NestedCustomAppBar> with SingleTickerProviderStateMixin {
  @override
  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(CategoryController());

    return Material(
      color: isDark ? AppColors.dark : AppColors.lightContainer,
      child: TabBar(
        controller: controller.tabController,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        tabs: controller.featuredCategories.map((element) => Tab(child: Text(element.name))).toList(),
      ),
    );
  }
}
