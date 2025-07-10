import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../loaders/loading_shimmer.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    required this.imageUrl,
    this.isNetworkImage = false,
    this.width = 150,
    this.height = 150,
    this.fit = BoxFit.fill,
    this.showBorderRadius = true,
    this.border,
    this.borderRadius = AppSizes.md,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.margin = const EdgeInsets.symmetric(vertical: AppSizes.md, horizontal: AppSizes.lg),
    this.backgroundColor = AppColors.grey,
  });

  final String imageUrl;
  final double? width, height;
  final BoxFit? fit;
  final bool? isNetworkImage;
  final bool? showBorderRadius;
  final BoxBorder? border;
  final double? borderRadius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: showBorderRadius! ? BorderRadius.circular(borderRadius!) : BorderRadius.zero,
          border: border,
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: showBorderRadius! ? BorderRadius.circular(borderRadius!) : BorderRadius.zero,
          child: isNetworkImage!
              ? CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageUrl,
                  width: width,
                  height: height,
                  placeholder: (context, url) => LoadingShimmer(
                    padding: EdgeInsets.zero,
                    width: width!,
                    height: height!,
                    raduis: borderRadius!,
                  ),
                )
              : Image(
                  image: AssetImage(imageUrl),
                  fit: fit,
                  width: width,
                  height: height,
                ),
        ),
      ),
    );
  }
}
