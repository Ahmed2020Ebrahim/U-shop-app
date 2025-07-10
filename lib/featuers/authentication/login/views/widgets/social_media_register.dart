import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/buttons/social_media_button.dart';
import '../../../../../common/widgets/dividers/centered_text_divider.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../controllers/login_controller.dart';

class SocialMediaRegister extends StatelessWidget {
  const SocialMediaRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      children: [
        const CenteredTextDivider(label: AppTexts.orSignInWith),
        const SizedBox(height: AppSizes.spaceBtwInputFields),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaButton(onTap: () async => await controller.googleSignIn(), child: const Image(image: AssetImage(AppImages.googleLogo))),
            const SizedBox(width: AppSizes.spaceBtwInputFields),
            SocialMediaButton(onTap: () {}, child: const Image(image: AssetImage(AppImages.facebookLogo))),
          ],
        )
      ],
    );
  }
}
