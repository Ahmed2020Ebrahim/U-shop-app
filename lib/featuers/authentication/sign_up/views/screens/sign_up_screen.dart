import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../login/views/widgets/social_media_register.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    HelperFunctions.setStatusBarBrightness(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! -------  REGISTER PAGE TITLE -------
            Text(AppTexts.letsCreateAccount, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSizes.spaceBtwSections),

            //! -------  REGISTER FORM -------
            const SignUpForm(),

            //! ------- SOCIAL MEDIA REGISTER --------
            const SocialMediaRegister()
          ],
        ),
      ),
    );
  }
}
