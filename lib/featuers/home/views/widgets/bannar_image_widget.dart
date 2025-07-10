import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../utils/constants/sizes.dart';

class BannarImageWidget extends StatelessWidget {
  const BannarImageWidget({
    required this.image,
    required this.onTap,
    this.isAsset = false,
    super.key,
  });
  final String image;
  final void Function()? onTap;
  final bool isAsset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.xl),
          child: isAsset
              ? Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const LoadingShimmer(width: double.infinity, height: double.infinity, raduis: AppSizes.xl),
                  errorWidget: (context, url, error) => const SizedBox(
                    child: Center(
                      child: Text("Cant load this image"),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
