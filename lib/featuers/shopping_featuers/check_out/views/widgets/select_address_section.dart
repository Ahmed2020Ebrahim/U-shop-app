import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/address/address_controller.dart';
import 'package:ushop/featuers/profile_featuers/adresses/views/screens/add_address_screen.dart';
import 'package:ushop/featuers/profile_featuers/adresses/views/widgets/addresses_card_listview.dart';

import '../../../../../common/widgets/titles/custome_title.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class SelectAddressSection extends StatelessWidget {
  const SelectAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddressController());
    final selectedUserAddress = controller.selectedUserAddress;

    return Obx(
      () => Column(
        children: [
          CustomeTitle(
            padding: EdgeInsets.zero,
            title: AppTexts.chippingAddress,
            trailing: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  builder: (context) {
                    return controller.allUserAddress.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("You did not add any address"),
                                const SizedBox(height: AppSizes.spaceBtwInputFields),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.to(() => const AddAddressScreen());
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                                    child: Text("Add Address Now"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                constraints: const BoxConstraints(minHeight: 100, maxHeight: 300),
                                child: const AddressesCardListview(),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  Get.to(() => const AddAddressScreen());
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                                  child: Text("Add New Adress"),
                                ),
                              ),
                            ],
                          );
                  },
                );
              },
              child: const Text(AppTexts.change),
            ),
          ),
          controller.loader.value
              ? const CircularProgressIndicator()
              : selectedUserAddress.value.isSelectedAddress == false
                  ? const Text("No Selected Address")
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person),
                              Text(selectedUserAddress.value.name),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.phone),
                              Text(selectedUserAddress.value.phoneNumber),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              Flexible(
                                  child: Text(
                                "${selectedUserAddress.value.street}, ${selectedUserAddress.value.city},${selectedUserAddress.value.country}",
                                maxLines: 3,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
        ],
      ),
    );
  }
}
