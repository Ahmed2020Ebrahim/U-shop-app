import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../../data/controllers/user/user_conroller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Obx(() {
      if (controller.profileLoading.value) {
        return const CircleAvatar(radius: 50, child: LoadingShimmer(width: 100, height: 100, raduis: 50));
      } else {
        if (controller.currentUser.value.profileImage == "") {
          return const CircleAvatar(
            backgroundColor: AppColors.light,
            radius: 50,
            backgroundImage: AssetImage(AppImages.defaultUserImage),
          );
        } else {
          return Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: controller.currentUser.value.profileImage,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => const LoadingShimmer(width: 100, height: 100),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }
      }
    });
  }
}
