import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/buttons/expanded_elevated_button.dart';
import '../../../../../common/widgets/screens/centered_aligned_columen.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/app_validators.dart';
import '../../controllers/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return CenteredAlignedColumn(
      closeable: true,
      onCloaseButtonTap: () => Get.back(),
      title: AppTexts.forgetPassword,
      subtitle2: AppTexts.forgetPasswordSubtitle,
      action1: Form(
        key: controller.forgetPasswordFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => AppValidators.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct), labelText: AppTexts.email),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
            ExpandedElevatedButton(onTap: () => controller.sendPasswordResetEmail(), text: AppTexts.continu),
          ],
        ),
      ),
    );
  }
}
