import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/utils/constants/colors.dart';
import 'package:ushop/utils/helpers/helper_functions.dart';

import '../../../../../data/controllers/cart/cart_controller.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class OrderPriceDetails extends StatelessWidget {
  const OrderPriceDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    var messageColor = cartController.promoCodeMessageColor;
    bool isdark = HelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          //total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text(AppTexts.subTotal), Text("\$${cartController.itemsTotalAmount.toStringAsFixed(2)}")],
          ),
          //shipping fee pricing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("${AppTexts.shippingFee}(5%)"), Text("\$${cartController.calculateShippingFeePrice().toStringAsFixed(2)}")],
          ),
          //tax fee pricing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("${AppTexts.taxFee}(14%)"), Text("\$${cartController.calculateTaxFeePrice().toStringAsFixed(2)}")],
          ),
          //promo code pricing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cartController.promoCodeMessage.value,
                style: TextStyle(
                    color: messageColor.value == AppColors.success || messageColor.value == AppColors.error || messageColor.value == AppColors.warning
                        ? cartController.promoCodeMessageColor.value
                        : isdark
                            ? AppColors.white
                            : AppColors.dark),
              ),
              Text("-\$${cartController.promoCodeDiscount.toStringAsFixed(2)}")
            ],
          ),

          const SizedBox(height: AppSizes.sm),
          //total pricing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.orderTotal,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "\$${cartController.orderTotalAmount.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
        ],
      ),
    );
  }
}
