import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/payment_method/payment_method_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

Future<dynamic> showPayMentBottomSheet(BuildContext context) {
  bool isDark = HelperFunctions.isDarkMode(context);
  return showModalBottomSheet(
    backgroundColor: isDark ? AppColors.black : AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (context) {
      PaymentMethodsController paymentController = Get.find();

      return Obx(
        () => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.sm),
            decoration: BoxDecoration(
              color: isDark ? AppColors.black : AppColors.white,
            ),
            child: Column(
              children: [
                ...List.generate(
                  paymentController.paymentMethods.length,
                  (index) {
                    bool isSelectd = paymentController.selectedPaymentMethod['name'] == paymentController.paymentMethods[index]['name'];
                    return Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: isSelectd ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
                      child: ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        onTap: () {
                          paymentController.onPaymentMethodSelected(paymentController.paymentMethods[index]['name']!, paymentController.paymentMethods[index]['image']!);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        leading: Image.asset(
                          paymentController.paymentMethods[index]['image']!,
                          width: 50,
                          height: 25,
                          fit: BoxFit.fill,
                        ),
                        title: Text(paymentController.paymentMethods[index]['name']!, style: Theme.of(context).textTheme.titleLarge),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
