import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../common/widgets/brand/brannd_card.dart';
import '../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../data/controllers/brands/brands_controller.dart';
import '../../../../data/controllers/products/products_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandsController());
    final productController = Get.put(ProductController());
    bool isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      //! -----> app bar
      appBar: const CustomeAppBar(title: Text('Brands'), padding: EdgeInsets.zero, showBackArrow: true),

      //! -----> body
      body: Obx(
        () {
          if (controller.loader.value) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: GridView.builder(
                padding: const EdgeInsets.all(AppSizes.md),
                itemCount: 16,
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
          if (controller.allBrands.isEmpty) {
            return const Center(
              child: Text("No Data Found"),
            );
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.xs),
              child: GridView.builder(
                padding: const EdgeInsets.all(AppSizes.md),
                itemCount: controller.allBrands.length,
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
                    await controller.setCurrentBrand(controller.allBrands[index]);
                    await productController.getBrandProducts(controller.allBrands[index]);
                  },
                  branndImageUrl: isDark ? controller.allBrands[index].imageUrl : controller.allBrands[index].imageUrl.replaceAll("light", "dark"),
                  brandName: controller.allBrands[index].name,
                  itemsNumbers: controller.allBrands[index].productsCount,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
