import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key, required this.width, required this.height, this.raduis = 15, this.color, this.padding = EdgeInsets.zero});
  final double width, height, raduis;
  final Color? color;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isdark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: isdark ? const Color.fromARGB(255, 66, 66, 66) : const Color.fromARGB(255, 224, 224, 224),
        highlightColor: isdark ? const Color.fromARGB(255, 158, 158, 158) : const Color.fromARGB(255, 245, 245, 245),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: color ?? (isdark ? AppColors.darkGrey : AppColors.light), borderRadius: BorderRadius.circular(raduis)),
        ),
      ),
    );
  }
}
