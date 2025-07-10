import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import 'package:ushop/data/controllers/order/order_controller.dart';
import 'package:ushop/data/controllers/paymob/paymob_controller.dart';
import 'package:ushop/utils/helpers/helper_functions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../items_cart/views/widgets/bottom_check_out_button.dart';
import '../../../items_cart/views/widgets/cart_item_card.dart';
import '../widgets/apply_promo_code_input.dart';
import '../widgets/order_price_details.dart';
import '../widgets/payment_method_section.dart';
import '../widgets/select_address_section.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    final orderController = Get.put(OrderController());
    final payMobController = Get.put(PaymobController());
    final cartItems = cartController.cartItemsList;

    return Scaffold(
      //! -----> app bar
      appBar: const CustomeAppBar(
        showBackArrow: true,
        padding: EdgeInsets.zero,
        title: Text(AppTexts.checkOut),
      ),

      //! -----> boy
      body: Obx(
        () => orderController.loader.value || payMobController.loader.value
            ? Stack(
                children: [
                  Container(
                    width: HelperFunctions.getScreenWidth(),
                    height: HelperFunctions.getScreenHeight(),
                    color: Colors.black.withOpacity(0.2),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(AppSizes.sm),

                      //! ---> container Row
                      child: Column(
                        children: [
                          //! ---> order list items
                          Container(
                            constraints: BoxConstraints(maxHeight: HelperFunctions.getScreenHeight() / 2.5),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...List.generate(
                                    cartController.cartItemsList.length,
                                    (index) => CartItemCard(
                                      imageUrl: cartItems[index].image,
                                      brandName: cartItems[index].brandName,
                                      description: cartItems[index].title,
                                      colorText: cartItems[index].selectedVariation!.color,
                                      size: cartItems[index].selectedVariation!.size,
                                      numberOfPices: cartItems[index].quantity,
                                      totalAmount: cartItems[index].quantity * cartItems[index].price,
                                      showAddRemoveButtons: false,
                                      showSmallSizeAndTotal: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //! -----> promo code input
                          const ApplyPromoCodeInput(),
                          const SizedBox(height: AppSizes.spaceBtwSections),

                          //! -----> Order Payment Details
                          Container(
                            padding: const EdgeInsets.all(AppSizes.md),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.darkGrey),
                              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                            ),
                            child: const Column(
                              children: [
                                //! -----> order price details
                                OrderPriceDetails(),

                                //! -----> divider
                                Divider(height: AppSizes.xl),

                                //! -----> payment method section
                                PaymentMethodSection(),

                                //! -----> address section
                                SizedBox(height: AppSizes.spaceBtwSections),
                                SelectAddressSection(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! -----> Checkout button
                  BottomCheckOutButton(
                    itemsTotalAmount: cartController.orderTotalAmount.value,
                    onTap: () async {
                      await payMobController.makePayment(cartController.orderTotalAmount.value.toInt() * 100);
                      if (payMobController.paymentKey.isNotEmpty) {
                        Get.to(() => const PaymentWebView());
                      }
                    },
                    text: "Confirm & Pay",
                  ),
                ],
              ),
      ),
    );
  }
}

class PaymentWebView extends StatelessWidget {
  const PaymentWebView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PaymobController payMobController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Obx(
        () => WebViewWidget(controller: payMobController.webViewController.value!),
      ),
    );
  }
}
