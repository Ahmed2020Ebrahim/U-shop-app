import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class CategoryItemButton extends StatelessWidget {
  const CategoryItemButton({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });
  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.light,
              child: Container(
                margin: const EdgeInsets.all(AppSizes.cardRadiusMd),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: image,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 50,
                  ),
                  placeholder: (context, url) => const LoadingShimmer(width: 50, height: 50, raduis: 25),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.sm),
            SizedBox(
              width: 50,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.light),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
