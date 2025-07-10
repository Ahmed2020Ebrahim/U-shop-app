import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/buttons/expanded_elevated_button.dart';
import '../../../../../common/widgets/screens/centered_aligned_columen.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../login/views/screens/login_screen.dart';
import '../../controllers/forget_password_controller.dart';

class ResetEmailSentScreen extends StatelessWidget {
  const ResetEmailSentScreen({required this.email, super.key});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return CenteredAlignedColumn(
      image: AppImages.verifyEmail1,
      title: AppTexts.resetPasswordemailverify,
      subtitle1: email,
      subtitle2: AppTexts.verifySubTitle2,
      action1: ExpandedElevatedButton(
        onTap: () => Get.offAll(() => const LoginScreen()),
        text: AppTexts.done,
      ),
      action2: TextButton(onPressed: () => controller.reSendPasswordResetEmail(email), child: const Text(AppTexts.resendEmail)),
    );
  }
}
