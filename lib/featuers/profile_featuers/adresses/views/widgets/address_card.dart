import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/common/widgets/shapes/circle.dart';
import 'package:ushop/data/models/address/address_model.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AdressCard extends StatelessWidget {
  const AdressCard({
    super.key,
    required this.addressModel,
    this.ontap,
  });
  final AddressModel addressModel;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
                right: AppSizes.lg,
                top: AppSizes.sm,
                child: addressModel.isSelectedAddress
                    ? const Icon(
                        Iconsax.tick_circle5,
                      )
                    : Circle(
                        raduis: 10,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: isDark ? AppColors.white : AppColors.black)),
                        ),
                      )),
            RoundedContainer(
              height: null,
              padding: const EdgeInsets.all(AppSizes.md),
              width: HelperFunctions.getScreenWidth(),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: addressModel.isSelectedAddress ? null : Border.all(color: AppColors.grey, width: 1),
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
                color: addressModel.isSelectedAddress ? AppColors.primary.withOpacity(0.4) : Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(addressModel.name, style: Theme.of(context).textTheme.titleLarge),
                  Text(addressModel.phoneNumber, style: Theme.of(context).textTheme.labelLarge),
                  Text(addressModel.street + addressModel.city + addressModel.country, maxLines: 3, style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
