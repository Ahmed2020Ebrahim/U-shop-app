import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, this.mainWidget, this.subWidget, this.title, this.subtitle, this.buttonText, this.onButtonTap});
  final Widget? mainWidget;
  final Widget? subWidget;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final void Function()? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (mainWidget != null)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                  height: HelperFunctions.getScreenHeight() / 3,
                  width: HelperFunctions.getScreenWidth(),
                  child: mainWidget,
                ),
              if (subWidget != null)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                  width: 100,
                  height: 100,
                  child: subWidget,
                ),
              if (title != null)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                  alignment: Alignment.center,
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              if (subtitle != null) Text(subtitle!, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onButtonTap, child: Text(buttonText ?? AppTexts.continu))),
            ],
          ),
        ),
      ),
    );
  }
}
