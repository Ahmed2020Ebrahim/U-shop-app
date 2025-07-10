import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    this.child,
    this.width = 400,
    this.height = 400,
    this.backgorundColor = AppColors.light,
    this.padding = 0,
    this.radius = 400,
    this.opacity = 0.2,
    this.margin = 0,
    this.border,
    this.alignment = Alignment.center,
    super.key,
  });

  final double? width;
  final double? height;
  final double padding;
  final double radius;
  final Widget? child;
  final Color backgorundColor;
  final double? opacity;
  final double? margin;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin!),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgorundColor.withOpacity(opacity!),
        border: border,
      ),
      child: child,
    );
  }
}
