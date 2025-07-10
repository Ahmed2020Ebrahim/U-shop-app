import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../common/widgets/buttons/expanded_elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/app_validators.dart';
import '../../controllers/edit_fullname_controller.dart';

class EditFullNameScreen extends StatelessWidget {
  const EditFullNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setStatusBarBrightness(context);
    final controller = Get.put(EditFullNameController());
    return Scaffold(
      appBar: const CustomeAppBar(
        showBackArrow: true,
        title: Text("Edit FullName"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Form(
          key: controller.editNameFormKey,
          child: Column(
            children: [
              Text(
                "this name will appare in several pages, so use a real name.",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              TextFormField(
                controller: controller.firstName,
                validator: (value) => AppValidators.validateEmptyTextField("FirstName", value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: "FirstName",
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.lastName,
                validator: (value) => AppValidators.validateEmptyTextField("LastName", value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: "LastName",
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              ExpandedElevatedButton(
                onTap: () async {
                  await controller.updateFullName();
                },
                text: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
