import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../widgets/create_acount_button.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../widgets/social_media_register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setStatusBarBrightness(context);
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginHeader(),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            LoginForm(),
            CreateAcountButton(),
            SocialMediaRegister(),
          ],
        ),
      ),
    );
  }
}
