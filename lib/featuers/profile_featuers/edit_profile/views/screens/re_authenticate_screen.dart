import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../data/controllers/user/user_conroller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/app_validators.dart';

class ReAuthenticationScree extends StatelessWidget {
  const ReAuthenticationScree({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setStatusBarBrightness(context);
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const CustomeAppBar(
        showBackArrow: true,
        title: Text("Re Authenticate"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            children: [
              const Text("plase inter your email and password"),
              const SizedBox(height: AppSizes.spaceBtwItems),
              TextFormField(
                controller: controller.verifyEmail,
                validator: (value) => AppValidators.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  hintText: AppTexts.email,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              Obx(
                () => TextFormField(
                  controller: controller.verifyPassword,
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
              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      side: const BorderSide(
                        color: Colors.transparent,
                      )),
                  onPressed: () async {
                    await controller.reAuthenticateWithEmailAndPassword();
                  },
                  child: const Text("Delete"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
