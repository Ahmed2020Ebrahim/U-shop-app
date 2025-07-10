import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class BottomCheckOutButton extends StatelessWidget {
  const BottomCheckOutButton({
    this.onTap,
    super.key,
    required this.itemsTotalAmount,
    required this.text,
  });
  final void Function()? onTap;
  final double itemsTotalAmount;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        width: double.infinity,
        child: ElevatedButton(onPressed: onTap, child: Text("$text (\$${itemsTotalAmount.toStringAsFixed(2)})")),
      ),
    );
  }
}
