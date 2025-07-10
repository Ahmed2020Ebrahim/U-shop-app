import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class CustomeTitle extends StatelessWidget {
  const CustomeTitle({
    super.key,
    required this.title,
    this.titleColor,
    this.trailing,
    this.padding,
  });
  final EdgeInsetsGeometry? padding;
  final Color? titleColor;
  final Widget? trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: titleColor),
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
