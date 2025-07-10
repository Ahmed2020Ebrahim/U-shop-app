import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomeDismissible extends StatelessWidget {
  const CustomeDismissible({
    super.key,
    required this.child,
    this.onDismissed,
  });
  final Widget child;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Delete this Item?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: AppColors.error),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
      onDismissed: onDismissed,
      background: Container(
        padding: const EdgeInsets.only(right: AppSizes.sm),
        decoration: const BoxDecoration(color: AppColors.error),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: AppColors.light, size: AppSizes.iconLg),
      ),
      key: UniqueKey(),
      child: child,
    );
  }
}
