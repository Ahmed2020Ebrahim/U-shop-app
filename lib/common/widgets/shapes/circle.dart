import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.raduis,
    this.child,
  });
  final double raduis;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: raduis * 2,
      height: raduis * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.textWhite.withOpacity(0.2),
      ),
      child: child,
    );
  }
}
