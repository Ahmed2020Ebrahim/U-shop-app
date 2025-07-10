import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/routes/app_routs.dart';
import '../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../data/controllers/category/category_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'category_item_button.dart';

class PopularCategoriesListView extends StatelessWidget {
  const PopularCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    ProductController productController = Get.find();
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.md, bottom: AppSizes.md),
      height: 85,
      child: Obx(
        () {
          if (categoryController.loader.value) {
            return ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoadingShimmer(width: 50, height: 50, raduis: 25),
                    SizedBox(height: AppSizes.md),
                    LoadingShimmer(width: 50, height: 12, raduis: 6),
                  ],
                ),
              ),
            );
          }
          if (categoryController.featuredCategories.isEmpty) {
            return Center(
              child: Text(
                "No Data Found",
                style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.light),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: categoryController.featuredCategories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryItemButton(
                image: categoryController.featuredCategories[index].image,
                title: categoryController.featuredCategories[index].name,
                onTap: () async {
                  await productController
                      .getCategoryProducts(
                    categoryController.featuredCategories[index].id,
                    categoryController.featuredCategories[index],
                  )
                      .then((_) {
                    Get.toNamed(AppRouts.subCategoryScreen);
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }
}
