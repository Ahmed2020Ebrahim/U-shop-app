import 'package:flutter/material.dart';
import '../../../../../common/widgets/buttons/expanded_elevated_button.dart';
import '../../../../../common/widgets/screens/centered_aligned_columen.dart';
import '../../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/texts.dart';

class VerifyComplatedScreen extends StatelessWidget {
  const VerifyComplatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CenteredAlignedColumn(
      image: AppImages.verifiedEmail1,
      title: AppTexts.verifyTitle2,
      subtitle2: AppTexts.verifySubTitle2,
      action1: ExpandedElevatedButton(
        onTap: () {
          AuthenticationRepository.instance.screenRedirect();
        },
        text: AppTexts.continu,
      ),
    );
  }
}
