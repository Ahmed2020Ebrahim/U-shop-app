import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/buttons/expanded_elevated_button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/app_validators.dart';
import '../../controllers/sign_up_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => AppValidators.validateEmptyTextField(AppTexts.firstName, value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    hintText: AppTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => AppValidators.validateEmptyTextField(AppTexts.lastName, value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    hintText: AppTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.userName,
            validator: (value) => AppValidators.validateEmptyTextField(AppTexts.userName, value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              hintText: AppTexts.userName,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidators.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_send),
              hintText: AppTexts.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => AppValidators.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              hintText: AppTexts.phoneNumber,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => AppValidators.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                hintText: AppTexts.password,
                suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    onPressed: () {
                      controller.hidePassword.value = !controller.hidePassword.value;
                    },
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Row(
            children: [
              Obx(
                () => SizedBox(
                  width: 20,
                  child: Checkbox(
                    value: controller.privacyPolicyValue.value,
                    onChanged: controller.changePrivacyPolicyValue,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.xl),
              Text.rich(
                TextSpan(
                  text: AppTexts.iAgreeTo,
                  children: [
                    TextSpan(
                      text: AppTexts.privacypolicy,
                      style: const TextStyle(color: AppColors.primary, decoration: TextDecoration.underline),
                      children: [
                        TextSpan(
                          text: AppTexts.and,
                          style: Theme.of(context).textTheme.labelSmall,
                          children: const [
                            TextSpan(
                              text: AppTexts.termsOfUses,
                              style: TextStyle(color: AppColors.primary, decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          ExpandedElevatedButton(
            onTap: () async {
              await controller.signUp();
            },
            text: AppTexts.createAccount,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
