import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProfileSettingsOption extends StatelessWidget {
  const ProfileSettingsOption({super.key, required this.title, required this.subtitle, required this.icon, this.showSwitch = false, this.onTap});
  final String title;
  final String subtitle;
  final IconData icon;
  final bool? showSwitch;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.lg * 1.5),
      leading: Icon(
        icon,
        color: AppColors.primary,
        size: AppSizes.iconMd + 4,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: showSwitch == false ? null : Switch(value: true, onChanged: (value) {}),
    );
  }
}
