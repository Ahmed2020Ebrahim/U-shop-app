import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import 'package:ushop/utils/device/device_utility.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ApplyPromoCodeInput extends StatelessWidget {
  const ApplyPromoCodeInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.find();
    return RoundedContainer(
      margin: const EdgeInsets.only(top: AppSizes.lg),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      ),
      width: HelperFunctions.getScreenWidth(),
      height: null,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: cartcontroller.promoCodeController.value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                hintText: AppTexts.ifHavePromeCode,
                hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: AppSizes.imageThumbSize,
            child: ElevatedButton(
              onPressed: () {
                AppDeviceUtilies.hideKeyBoard(context);
                cartcontroller.applayPromoCode();
              },
              child: const Text(AppTexts.apply),
            ),
          ),
        ],
      ),
    );
  }
}
