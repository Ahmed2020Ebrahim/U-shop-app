import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/buttons/expanded_elevated_button.dart';
import '../../../../../routes/app_routs.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/app_validators.dart';
import '../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidators.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              hintText: AppTexts.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.passwordVisabilty.value,
              validator: (value) => AppValidators.validateEmptyTextField("Password", value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                hintText: AppTexts.password,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  onPressed: () {
                    controller.passwordVisabilty.value = !controller.passwordVisabilty.value;
                  },
                  icon: Icon(controller.passwordVisabilty.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Row(
            children: [
              Obx(
                () => SizedBox(
                  width: 30,
                  child: Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: (value) {
                      controller.rememberMe.value = !controller.rememberMe.value;
                    },
                  ),
                ),
              ),
              Text(AppTexts.rememberMe, style: Theme.of(context).textTheme.labelLarge),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRouts.forgetPasswordScreen);
                },
                child: const Text(AppTexts.forgetPassword),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          ExpandedElevatedButton(onTap: () async => await controller.login(), text: AppTexts.signIn),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
        ],
      ),
    );
  }
}
