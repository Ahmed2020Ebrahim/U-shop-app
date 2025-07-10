import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({
    this.title,
    this.actions,
    this.leadingIcon,
    this.onLeadingIconTap,
    this.showBackArrow = false,
    this.revirsStatusBar = false,
    this.backArrowColor,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
    super.key,
  });
  final Widget? title;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingIconTap;
  final bool? revirsStatusBar;
  final bool showBackArrow;
  final Color? backArrowColor;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    bool isDark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: AppBar(
        backgroundColor: backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: backArrowColor ?? (isDark ? AppColors.light : AppColors.black),
                ))
            : leadingIcon != null
                ? IconButton(onPressed: onLeadingIconTap, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);
}
