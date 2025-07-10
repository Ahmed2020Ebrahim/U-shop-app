import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ushop/data/controllers/order/order_controller.dart';
import 'package:ushop/featuers/products.dart/views/screens/all_products_screen.dart';
import '../../../../../common/widgets/bars/custom_appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    orderController.fetchOrders();
    return Scaffold(
      //! -----> App bar
      appBar: const CustomeAppBar(showBackArrow: true, title: Text(AppTexts.myOrders), padding: EdgeInsets.zero),

      //! -----> body
      body: Obx(
        () => orderController.loader.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : orderController.ordersList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("You didn't make any Order"),
                        const SizedBox(height: AppSizes.spaceBtwInputFields),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => const AllProductsScreen());
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [Text("Make Order Now"), Icon(Iconsax.add)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          orderController.ordersList.length,
                          (index) => OrderCard(
                            order: orderController.ordersList[index],
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
