import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/buttons/expanded_elevated_button.dart';
import '../../../../../common/widgets/screens/centered_aligned_columen.dart';
import '../../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/texts.dart';
import '../../controllers/verify_email_controller.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({
    this.email,
    super.key,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return CenteredAlignedColumn(
      image: AppImages.verifyEmail1,
      title: AppTexts.verifyTitle1,
      subtitle1: email,
      subtitle2: AppTexts.verifySubTitle2,
      action1: ExpandedElevatedButton(
        onTap: () async {
          await controller.checkEmailVerification();
        },
        text: AppTexts.continu,
      ),
      action2: TextButton(
          onPressed: () async {
            controller.sendEmailVerification();
          },
          child: const Text(AppTexts.resendEmail)),
      closeable: true,
      onCloaseButtonTap: () {
        AuthenticationRepository.instance.logOut();
      },
    );
  }
}
