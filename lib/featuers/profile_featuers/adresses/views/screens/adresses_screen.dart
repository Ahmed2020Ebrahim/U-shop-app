import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/address/address_controller.dart';
import 'package:ushop/utils/constants/sizes.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../widgets/addresses_card_listview.dart';
import 'add_address_screen.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      //! -----> app bar
      appBar: const CustomeAppBar(
        padding: EdgeInsets.zero,
        showBackArrow: true,
        title: Text("Addresses"),
      ),

      //! -----> floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddAddressScreen()),
        backgroundColor: AppColors.primary,
        child: const Icon(
          Iconsax.add,
          color: AppColors.light,
        ),
      ),

      //!-----> body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Obx(
          () {
            if (controller.loader.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.allUserAddress.isEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No Addressess Added Yet"),
                    TextButton(onPressed: () => Get.to(() => const AddAddressScreen()), child: const Text('Add New Address')),
                  ],
                ),
              );
            } else {
              return const AddressesCardListview();
            }
          },
        ),
      ),
    );
  }
}
