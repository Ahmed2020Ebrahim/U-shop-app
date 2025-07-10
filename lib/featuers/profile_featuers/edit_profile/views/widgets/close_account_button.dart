import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/controllers/user/user_conroller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/popups/app_popups.dart';

class CloaseAcountButton extends StatelessWidget {
  const CloaseAcountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TextButton(
      onPressed: () {
        AppPopups.showCancelConfirmAlertDialog(
            title: "Delete Account",
            content: "Are you sure you want to delete your account?",
            onConfirm: () async {
              await controller.deletUserAccount();
            });
      },
      child: Text(
        AppTexts.closeAccount,
        style: Theme.of(context).textTheme.titleSmall!.apply(color: AppColors.error),
      ),
    );
  }
}
