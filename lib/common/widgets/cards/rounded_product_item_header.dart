import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../containers/circuler_container.dart';
import '../loaders/loading_shimmer.dart';

class RoundedProductItemHeader extends StatelessWidget {
  const RoundedProductItemHeader({
    required this.imageUrl,
    this.isNetworkImage = false,
    this.width = AppSizes.productImageSize,
    this.height = AppSizes.productImageSize,
    this.borderRadius = AppSizes.cardRadiusLg,
    this.imageBackgroundColor,
    this.saleText,
    this.topRightIcon,
    this.onTopRightIconTap,
    this.topRightIconColor,
    this.topRightIconBackGroundColor,
    this.saleBackGroundColor,
    this.isHorizontal = false,
    super.key,
  });

  final String imageUrl;
  final bool? isNetworkImage;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? imageBackgroundColor;
  final String? saleText;
  final IconData? topRightIcon;
  final VoidCallback? onTopRightIconTap;
  final Color? topRightIconColor;
  final Color? topRightIconBackGroundColor;
  final Color? saleBackGroundColor;
  final bool? isHorizontal;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: imageBackgroundColor ?? (isDark ? AppColors.black : AppColors.lightGrey),
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              child: isNetworkImage!
                  ? CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: imageUrl,
                      placeholder: (context, url) => const LoadingShimmer(
                        width: double.infinity,
                        height: double.infinity,
                        raduis: 12,
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Column(
                          children: [
                            Icon(Icons.error),
                            Text("image error"),
                          ],
                        ),
                      ),
                    )
                  : Image(
                      fit: BoxFit.fill,
                      image: AssetImage(imageUrl),
                    ),
            ),
          ),
          if (topRightIcon != null)
            Positioned(
              top: isHorizontal! ? 2 : 13,
              right: isHorizontal! ? 4 : 8,
              child: GestureDetector(
                onTap: onTopRightIconTap,
                child: CircularContainer(
                  width: 40,
                  height: 40,
                  backgorundColor: topRightIconBackGroundColor ?? (isDark ? AppColors.darkGrey : AppColors.light),
                  opacity: 0.8,
                  child: Center(
                      child: Icon(
                    topRightIcon,
                    color: topRightIconColor ?? (isDark ? AppColors.light : AppColors.dark),
                  )),
                ),
              ),
            ),
          if (saleText != null)
            Positioned(
              top: isHorizontal! ? 8 : 20,
              left: isHorizontal! ? 4 : 8,
              child: Container(
                alignment: Alignment.center,
                width: 45,
                height: 25,
                decoration: BoxDecoration(color: saleBackGroundColor ?? AppColors.secondary.withOpacity(0.8), borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd)),
                child: Text(
                  "78%",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall!.apply(color: AppColors.black),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
