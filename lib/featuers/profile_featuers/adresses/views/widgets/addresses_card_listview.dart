import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/dismissible/custome_dismissible.dart';
import '../../../../../data/controllers/address/address_controller.dart';
import 'address_card.dart';

class AddressesCardListview extends StatelessWidget {
  const AddressesCardListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Obx(
      () => controller.loader.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.allUserAddress.length,
              itemBuilder: (context, index) => CustomeDismissible(
                onDismissed: (p0) async {
                  await controller.deletAddress(controller.allUserAddress[index].id);
                },
                child: AdressCard(
                  ontap: () async {
                    await controller.selectNewAddress(controller.allUserAddress[index].id);
                  },
                  addressModel: controller.allUserAddress[index],
                ),
              ),
            ),
    );
  }
}
