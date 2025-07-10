import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/favorites/favorites_controller.dart';
import '../shapes/circle.dart';

class FavoritButton extends StatelessWidget {
  const FavoritButton({
    super.key,
    required this.productId,
    this.onfavoritButtonTab,
  });

  final String productId;
  final void Function()? onfavoritButtonTab;

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritController = Get.find();
    return Circle(
      raduis: 20,
      child: Obx(
        () => IconButton(
          onPressed: onfavoritButtonTab,
          icon: favoritController.isFavorit(productId)
              ? const Icon(
                  Iconsax.heart5,
                  color: Colors.red,
                )
              : const Icon(Iconsax.heart),
        ),
      ),
    );
  }
}
