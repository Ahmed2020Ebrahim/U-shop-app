import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import '../../../../../common/dismissible/custome_dismissible.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../check_out/views/screens/check_out_screen.dart';
import '../widgets/bottom_check_out_button.dart';
import '../widgets/cart_item_card.dart';

class ItemsCartScreen extends StatelessWidget {
  const ItemsCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    var cartItems = cartController.cartItemsList;
    return Scaffold(
      //! ----> App bar
      appBar: const CustomeAppBar(
        showBackArrow: true,
        padding: EdgeInsets.zero,
        title: Text("Cart"),
      ),

      //! -----> body
      body: Obx(
        () => Column(
          children: [
            Expanded(
              flex: 7,
              child: cartController.cartItemsList.isEmpty
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text("No Items Added Yet"),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(AppSizes.sm),

                      //! ---> container Row
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.cartItemsList.length,
                            (index) => CustomeDismissible(
                              onDismissed: (_) {
                                cartController.removeItem(cartItems[index]);
                              },
                              child: CartItemCard(
                                onIncreasTap: () {
                                  cartController.increasOneIte(cartItems[index]);
                                },
                                onDecreasTap: () {
                                  cartController.decreasOneItem(cartItems[index]);
                                },
                                imageUrl: cartItems[index].image,
                                brandName: cartItems[index].brandName,
                                description: cartItems[index].title,
                                colorText: cartItems[index].selectedVariation!.color,
                                size: cartItems[index].selectedVariation!.size,
                                numberOfPices: cartItems[index].quantity,
                                totalAmount: cartItems[index].price * cartItems[index].quantity,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),

            //! -----> Checkout button
            BottomCheckOutButton(
              itemsTotalAmount: cartController.itemsTotalAmount.value,
              onTap: () {
                cartController.calculateOrderTotalAmount();
                Get.to(() => const CheckOutScreen());
              },
              text: "Order Now",
            )
          ],
        ),
      ),
    );
  }
}
