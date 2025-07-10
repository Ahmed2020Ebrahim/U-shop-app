import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/controllers/order/order_controller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

Future<dynamic> orderConfirmationDialog(BuildContext context) {
  final orderController = Get.put(OrderController());
  bool isDark = HelperFunctions.isDarkMode(context);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Confirm by click Ok"),
      content: const Text("by click ok , you will confirm your payment"),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () async {
            Get.back();
            await orderController.commitSaveOrder();
          },
          child: Text(
            "ok",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primary),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: AppSizes.md)),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text("Cancel", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: isDark ? AppColors.light : AppColors.dark)),
        ),
      ],
    ),
  );
}
