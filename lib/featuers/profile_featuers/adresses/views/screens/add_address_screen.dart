import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/address/address_controller.dart';
import 'package:ushop/utils/validators/app_validators.dart';

import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    SizedBox space = const SizedBox(height: AppSizes.spaceBtwInputFields);
    return Scaffold(
      //! -----> AppBar
      appBar: const CustomeAppBar(
        padding: EdgeInsets.zero,
        showBackArrow: true,
        title: Text("Add New Address"),
      ),

      //! -----> body
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: Obx(
            () => Form(
              key: controller.newAddressFromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //! -----> name
                  TextFormField(
                    controller: controller.name.value,
                    validator: (value) => AppValidators.validateEmptyTextField("Name", value),
                    keyboardType: TextInputType.name,
                    onTapOutside: (event) {},
                    decoration: const InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  space,
                  //! -----> phone number
                  TextFormField(
                    controller: controller.phoneNumber.value,
                    validator: (value) => AppValidators.validatePhoneNumber(value),
                    keyboardType: TextInputType.phone,
                    onTapOutside: (event) {
                      AppDeviceUtilies.hideKeyBoard(context);
                    },
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Iconsax.mobile),
                    ),
                  ),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //! -----> street
                      SizedBox(
                        width: HelperFunctions.getScreenWidth() / 2 - 30,
                        child: TextFormField(
                          controller: controller.street.value,
                          validator: (value) => AppValidators.validateEmptyTextField("Street", value),
                          keyboardType: TextInputType.name,
                          onTapOutside: (event) {
                            AppDeviceUtilies.hideKeyBoard(context);
                          },
                          decoration: const InputDecoration(
                            labelText: "Street",
                            prefixIcon: Icon(Iconsax.map),
                          ),
                        ),
                      ),

                      //! -----> Postal code
                      SizedBox(
                        width: HelperFunctions.getScreenWidth() / 2 - 30,
                        child: TextFormField(
                          controller: controller.postalCode.value,
                          validator: (value) => AppValidators.validateEmptyTextField("Postal Code", value),
                          keyboardType: TextInputType.number,
                          onTapOutside: (event) {
                            AppDeviceUtilies.hideKeyBoard(context);
                          },
                          decoration: const InputDecoration(
                            labelText: "Postal code",
                            prefixIcon: Icon(Iconsax.card_pos),
                          ),
                        ),
                      ),
                    ],
                  ),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //! -----> city
                      SizedBox(
                        width: HelperFunctions.getScreenWidth() / 2 - 30,
                        child: TextFormField(
                          controller: controller.city.value,
                          validator: (value) => AppValidators.validateEmptyTextField("City", value),
                          keyboardType: TextInputType.name,
                          onTapOutside: (event) {
                            AppDeviceUtilies.hideKeyBoard(context);
                          },
                          decoration: const InputDecoration(
                            labelText: "City",
                            prefixIcon: Icon(Iconsax.building),
                          ),
                        ),
                      ),

                      //! -----> state
                      SizedBox(
                        width: HelperFunctions.getScreenWidth() / 2 - 30,
                        child: TextFormField(
                          controller: controller.state.value,
                          validator: (value) => AppValidators.validateEmptyTextField("State", value),
                          keyboardType: TextInputType.name,
                          onTapOutside: (event) {
                            AppDeviceUtilies.hideKeyBoard(context);
                          },
                          decoration: const InputDecoration(
                            labelText: "State",
                            prefixIcon: Icon(Iconsax.building1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  space,

                  //! -----> country
                  TextFormField(
                    controller: controller.country.value,
                    validator: (value) => AppValidators.validateEmptyTextField("Country", value),
                    keyboardType: TextInputType.name,
                    onTapOutside: (event) {
                      AppDeviceUtilies.hideKeyBoard(context);
                    },
                    decoration: const InputDecoration(
                      labelText: "Country",
                      prefixIcon: Icon(Iconsax.courthouse),
                    ),
                  ),

                  //! ------> save button
                  space, space,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller.addNewAddress();
                        },
                        child: const Text("Save")),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
