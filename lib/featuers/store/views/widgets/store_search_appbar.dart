import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/common/widgets/bars/app_search_bar.dart';
import 'package:ushop/featuers/search/views/screens/search_screen.dart';
import '../../../../common/widgets/brand/brannd_card.dart';
import '../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../common/widgets/titles/custome_title.dart';
import '../../../../data/controllers/brands/brands_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../brands/views/screens/all_brands_screen.dart';

class StoreSearchAppBar extends StatelessWidget {
  const StoreSearchAppBar({
    super.key,
    required this.bottom,
  });
  final PreferredSizeWidget bottom;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(BrandsController());
    final productController = Get.put(ProductController());

    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: HelperFunctions.getScreenHeight() * 0.50,
      backgroundColor: isDark ? AppColors.dark : AppColors.lightContainer,
      pinned: true,
      floating: true,
      flexibleSpace: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // AppSearchBar(onTap: () {}),
          AppSearchBar(
            borderColor: AppColors.dark,
            onTap: () {
              Get.to(() => const SearchScreen());
            },
          ),

          CustomeTitle(
            title: "Featured Brands",
            trailing: TextButton(
              onPressed: () {
                Get.to(() => const AllBrandsScreen());
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: const Text(AppTexts.viewAll),
            ),
          ),
          Obx(
            () {
              if (controller.loader.value) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSizes.xs),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(AppSizes.md),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppSizes.gridViewSpacing,
                      mainAxisSpacing: AppSizes.gridViewSpacing,
                      mainAxisExtent: 80,
                    ),
                    itemBuilder: (context, index) => const LoadingShimmer(width: double.infinity, height: double.infinity),
                  ),
                );
              }
              if (controller.featuredBrands.isEmpty) {
                return const Center(
                  child: Text("No Data Found"),
                );
              } else {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSizes.xs),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(AppSizes.md),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppSizes.gridViewSpacing,
                      mainAxisSpacing: AppSizes.gridViewSpacing,
                      mainAxisExtent: 80,
                    ),
                    itemBuilder: (context, index) => BranndCard(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                      onTap: () async {
                        await controller.setCurrentBrand(controller.featuredBrands[index]);
                        await productController.getBrandProducts(controller.featuredBrands[index]);
                      },
                      branndImageUrl: isDark ? controller.featuredBrands[index].imageUrl : controller.featuredBrands[index].imageUrl.replaceAll("light", "dark"),
                      brandName: controller.featuredBrands[index].name,
                      itemsNumbers: controller.featuredBrands[index].productsCount,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottom: bottom,
    );
  }
}
