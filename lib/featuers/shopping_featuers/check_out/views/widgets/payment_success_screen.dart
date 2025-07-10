import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/common/widgets/screens/succes_screen.dart';
import 'package:ushop/routes/app_routs.dart';
import 'package:ushop/utils/constants/images.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      buttonText: "Back To Home",
      onButtonTap: () => Get.offAllNamed(AppRouts.bottomNavigationMenu),
      mainWidget: Image.asset(AppImages.succesTick, width: 200, height: 200),
      title: "Payment Success",
      subtitle: "Your payment has been successfully processed.",
    );
  }
}
