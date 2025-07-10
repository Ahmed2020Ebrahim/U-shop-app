import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import '../../../../common/widgets/loaders/loading_shimmer.dart';
import '../../../../data/controllers/user/user_conroller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../common/widgets/buttons/item_numbers_bag_button.dart';
import '../../../shopping_featuers/items_cart/views/screens/items_cart_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final cartController = Get.put(CartController());
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Obx(
          () => ItemsNumberBagButton(
            cartItemsNumber: cartController.cartItemsNumber.value,
            onTap: () {
              Get.to(() => const ItemsCartScreen());
            },
          ),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.welcomeMessage,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.light.withOpacity(0.7)),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const LoadingShimmer(width: 130, height: 22);
            } else {
              return Text(
                controller.currentUser.value.getFullName,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.light),
              );
            }
          }),
        ],
      ),
    );
  }
}
