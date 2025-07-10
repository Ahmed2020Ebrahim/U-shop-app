import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../common/widgets/titles/custome_title.dart';
import '../../../../../data/controllers/user/user_conroller.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../widgets/close_account_button.dart';
import '../widgets/user_profile_image.dart';
import 'edit_fullname_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const CustomeAppBar(
        showBackArrow: true,
        title: Text(AppTexts.profile),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UserProfileImage(),
            TextButton(
              onPressed: () async => await controller.uploadUserImage(),
              child: const Text(
                AppTexts.changeYourImage,
              ),
            ),
            const Divider(height: AppSizes.spaceBtwSections),
            const CustomeTitle(title: AppTexts.profileInfo),
            informationItem(context, AppTexts.name, controller.currentUser.value.getFullName, () {
              Get.to(() => const EditFullNameScreen());
            }),
            informationItem(context, AppTexts.capUserName, controller.currentUser.value.userName, () {}),
            const Divider(height: AppSizes.spaceBtwSections),
            const CustomeTitle(title: AppTexts.personalInfor),
            informationItem(context, AppTexts.userId, controller.currentUser.value.id, () {}, trailingIcon: Iconsax.copy),
            informationItem(context, AppTexts.email, controller.currentUser.value.email, () {}),
            informationItem(context, AppTexts.phoneNumber, controller.currentUser.value.phoneNumber, () {}),
            informationItem(context, AppTexts.gender, "Mail", () {}),
            informationItem(context, AppTexts.dateOfBirth, "13/8/1998", () {}),
            const Divider(height: AppSizes.spaceBtwSections),
            const CloaseAcountButton(),
          ],
        ),
      ),
    );
  }

  ListTile informationItem(BuildContext context, String leading, String title, VoidCallback? onTap, {IconData? trailingIcon = Icons.arrow_forward_ios}) {
    return ListTile(
      dense: true,
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: AppSizes.lg,
      leading: SizedBox(
        width: HelperFunctions.getScreenWidth() / 4,
        child: Text(
          leading,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(
          trailingIcon,
        ),
      ),
    );
  }
}
