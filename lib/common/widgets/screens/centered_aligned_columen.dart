import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CenteredAlignedColumn extends StatelessWidget {
  const CenteredAlignedColumn({
    super.key,
    this.image,
    this.title,
    this.subtitle1,
    this.subtitle2,
    this.action1,
    this.action2,
    this.closeable = false,
    this.onCloaseButtonTap,
  });
  final String? image;
  final String? title;
  final String? subtitle1;
  final String? subtitle2;
  final Widget? action1;
  final Widget? action2;
  final bool closeable;
  final void Function()? onCloaseButtonTap;

  @override
  Widget build(BuildContext context) {
    SizedBox space = const SizedBox(height: AppSizes.spaceBtwInputFields);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (image != null) Image(image: AssetImage(image!), width: HelperFunctions.getScreenWidth() * 0.7),
                    if (image != null) space,
                    if (title != null) Text(title!, style: Theme.of(context).textTheme.headlineSmall),
                    if (title != null) space,
                    if (subtitle1 != null) Text(subtitle1!, style: Theme.of(context).textTheme.labelLarge),
                    if (subtitle1 != null) space,
                    if (subtitle2 != null) Text(subtitle2!, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                    if (subtitle2 != null) space,
                    if (action1 != null) action1!,
                    if (action1 != null) space,
                    if (action2 != null) action2!,
                  ],
                ),
              ),
            ),
          ),
          closeable
              ? Positioned(
                  top: AppSizes.xl * 2,
                  right: AppSizes.md,
                  child: IconButton(onPressed: onCloaseButtonTap, icon: const Icon(Icons.close)),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
