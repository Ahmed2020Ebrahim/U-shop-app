import "package:flutter/material.dart";

import "../../../../../utils/constants/sizes.dart";

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Check Out"),
      ),
    );
  }
}
