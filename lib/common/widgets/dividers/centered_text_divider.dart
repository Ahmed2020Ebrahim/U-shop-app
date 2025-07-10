import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CenteredTextDivider extends StatelessWidget {
  const CenteredTextDivider({
    required this.label,
    super.key,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Divider(color: AppColors.grey, thickness: 0.8, endIndent: 10, indent: 20)),
        Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.darkGrey)),
        const Flexible(child: Divider(color: AppColors.grey, thickness: 0.8, endIndent: 20, indent: 10)),
      ],
    );
  }
}
