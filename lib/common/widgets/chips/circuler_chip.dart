import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';
import '../containers/circuler_container.dart';

class CirculerChip extends StatelessWidget {
  const CirculerChip({
    super.key,
    required this.color,
    required this.selected,
    this.onSelected,
  });

  final String color;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return HelperFunctions.getColor(color) != null
        ? ChoiceChip(
            onSelected: onSelected,
            selected: selected,
            label: const SizedBox(),
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            shape: const CircleBorder(),
            backgroundColor: HelperFunctions.getColor(color),
            selectedColor: HelperFunctions.getColor(color) ?? Colors.red,
            selectedShadowColor: Colors.transparent,
            avatar: HelperFunctions.getColor(color) != null
                ? const CircularContainer(
                    width: 25,
                    height: 25,
                    opacity: 0,
                    backgorundColor: Colors.transparent,
                  )
                : null,
          )
        : const SizedBox();
  }
}
