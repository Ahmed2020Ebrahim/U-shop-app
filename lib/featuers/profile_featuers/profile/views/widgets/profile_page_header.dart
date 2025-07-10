import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/custom_shapes/bottom_edget_clipper.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../../common/widgets/shapes/circle.dart';
import '../../../../../data/controllers/user/user_conroller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../edit_profile/views/screens/edit_profile_screen.dart';

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ClipPath(
      clipper: BottomEadgedClipper(),
      child: Container(
        color: AppColors.primary,
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              const Positioned(top: -150, right: -250, child: Circle(raduis: 200)),

              //! --- SECOND CIRCLE ----
              const Positioned(top: 100, right: -300, child: Circle(raduis: 200)),
              Column(
                children: [
                  CustomeAppBar(
                    title: Text(
                      AppTexts.account,
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.light),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                    horizontalTitleGap: 0,
                    leading: Obx(() {
                      if (controller.profileLoading.value) {
                        return const CircleAvatar(radius: 40, child: LoadingShimmer(width: 50, height: 50, raduis: 40));
                      } else {
                        if (controller.currentUser.value.profileImage == "") {
                          return const CircleAvatar(
                            backgroundColor: AppColors.light,
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.defaultUserImage),
                          );
                        } else {
                          return CircleAvatar(
                            backgroundColor: AppColors.light,
                            radius: 40,
                            backgroundImage: NetworkImage(controller.currentUser.value.profileImage),
                          );
                        }
                      }
                    }),
                    title: Obx(() {
                      if (controller.profileLoading.value) {
                        return const LoadingShimmer(width: 200, height: 15, padding: EdgeInsets.symmetric(horizontal: 10));
                      } else {
                        return Text(
                          controller.currentUser.value.getFullName,
                          style: Theme.of(context).textTheme.titleLarge!.apply(color: AppColors.light),
                        );
                      }
                    }),
                    subtitle: Obx(() {
                      if (controller.profileLoading.value) {
                        return const LoadingShimmer(width: 200, height: 15, padding: EdgeInsets.symmetric(horizontal: 10));
                      } else {
                        return Text(
                          controller.currentUser.value.email,
                          style: Theme.of(context).textTheme.bodySmall!.apply(color: AppColors.grey),
                        );
                      }
                    }),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(() => const EditProfileScreen());
                      },
                      icon: const Icon(
                        Iconsax.edit,
                        color: AppColors.light,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
