import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routs.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class CreateAcountButton extends StatelessWidget {
  const CreateAcountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Get.toNamed(AppRouts.registerScreen);
            },
            style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.grey)),
            child: const Text(AppTexts.createAccount),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),
      ],
    );
  }
}
