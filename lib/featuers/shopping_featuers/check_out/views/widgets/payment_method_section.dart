import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/payment_method/payment_method_controller.dart';
import '../../../../../common/widgets/titles/custome_title.dart';
import '../../../../../utils/constants/texts.dart';
import 'payment_bottom_sheet.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final paymentController = Get.put(PaymentMethodsController());
    return Column(
      children: [
        CustomeTitle(
          padding: EdgeInsets.zero,
          title: AppTexts.paymentMethod,
          trailing: TextButton(
            onPressed: () {
              showPayMentBottomSheet(context);
            },
            child: const Text(AppTexts.change),
          ),
        ),
        Obx(() => ListTile(
              leading: Image(
                width: 60,
                height: 50,
                fit: BoxFit.fill,
                image: AssetImage(paymentController.selectedPaymentMethod['image']),
              ),
              title: Text(paymentController.selectedPaymentMethod['name']),
            ))
      ],
    );
  }
}
