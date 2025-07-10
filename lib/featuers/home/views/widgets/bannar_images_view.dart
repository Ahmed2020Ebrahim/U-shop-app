import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../data/controllers/banners/banner_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'bannar_image_widget.dart';

class BannarImagesView extends StatelessWidget {
  const BannarImagesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BannerController controller = Get.put(BannerController());
    bool isdark = HelperFunctions.isDarkMode(context);
    return Obx(() {
      if (controller.activeBanners.isEmpty) {
        return LoadingShimmer(height: 170, width: HelperFunctions.getScreenWidth() - 60, raduis: AppSizes.xl);
      } else {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: AppSizes.defaultSpace, horizontal: AppSizes.md),
              height: 170,
              width: HelperFunctions.getScreenWidth(),
              child: PageView(
                onPageChanged: controller.updateCurrentPage,
                controller: controller.pageViewController,
                children: controller.activeBanners.reversed.map((element) {
                  if (controller.loader.value) {
                    return const LoadingShimmer(width: double.infinity, height: double.infinity, raduis: AppSizes.xl);
                  }
                  if (controller.activeBanners.isEmpty) {
                    return BannarImageWidget(image: AppImages.salesSoon, onTap: () {}, isAsset: true);
                  } else {
                    return BannarImageWidget(image: element.imageUrl, onTap: () {});
                  }
                }).toList(),
              ),
            ),
            SmoothPageIndicator(
              controller: controller.pageViewController,
              count: controller.activeBanners.length,
              onDotClicked: controller.indecatorScrolle,
              effect: WormEffect(activeDotColor: isdark ? AppColors.light : AppColors.dark, dotHeight: 6),
            ),
          ],
        );
      }
    });
  }
}
