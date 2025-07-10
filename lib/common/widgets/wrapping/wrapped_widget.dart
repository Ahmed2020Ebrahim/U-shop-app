import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class WrapedWidgets extends StatelessWidget {
  const WrapedWidgets({
    super.key,
    required this.itemCount,
    required this.generator,
    this.crossSpacing = AppSizes.md,
    this.mainSpacing = AppSizes.md,
    
  });
  final int itemCount;
  final double? crossSpacing;
  final double? mainSpacing;
  final Widget Function(int) generator;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: crossSpacing!,
      runSpacing: mainSpacing!,
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: [
        ...List.generate(
          itemCount,
          generator,
        ),
      ],
    );
  }
}
