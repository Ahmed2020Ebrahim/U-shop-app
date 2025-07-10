import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop/data/controllers/address/address_controller.dart';
import 'package:ushop/data/controllers/cart/cart_controller.dart';
import 'package:ushop/data/controllers/payment_method/payment_method_controller.dart';
import 'package:ushop/data/models/order/order_model.dart';
import 'package:ushop/data/repositories/order_repository/order_repository.dart';
import 'package:ushop/utils/logging/app_logger.dart';
import 'package:uuid/uuid.dart';

import '../../../common/widgets/screens/loading_screen.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/app_popups.dart';
import '../../models/user/user_model.dart';
import '../../repositories/authentication_repository/authentication_repository.dart';
import '../user/user_conroller.dart';

class OrderController extends GetxController {
//*******************************************instance creator***************************************/
  //instance creator
  static OrderController get instance => Get.find();

//******************************************* variabels ***************************************/
  //orders list
  RxList<OrderModel> ordersList = <OrderModel>[].obs;

  //loader
  RxBool loader = false.obs;

  //order repository
  final OrderRepository _orderRepository = Get.put(OrderRepository());

  //current order
  Rx<OrderModel> currentOrder = OrderModel.emptyOrderModel().obs;

//******************************************* overrided ***************************************/
  // @override
  // void onInit() {
  //   fetchOrders;
  //   super.onInit();
  // }

//******************************************* variabels ***************************************/
  //fatch orders
  Future<void> fetchOrders() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }
      //start loading
      loader.value = true;

      //fatch data
      final data = await _orderRepository.fetchOrders();

      //asign allProducts
      ordersList.assignAll(data);

      //stop loading
      loader.value = false;
    } catch (e) {
      //show error message
      AppPopups.showErrorSnackBar(title: "oh oops", message: e.toString());
    } finally {
      //stop loading
      loader.value = false;
    }
  }

  //commit checkout
  //save order
  Future<void> commitSaveOrder() async {
    try {
      //check internet connection
      final isConnected = await NetworkManager.instance.isNetworkConnection();
      if (!isConnected) {
        AppPopups.showErrorSnackBar(title: "NO INTERNET CONNECTION", message: "please check your internet connection and try again");
        return;
      }
      //start loading
      loader.value = true;

      //save order
      await _saveOrder();

      //stop loading
      loader.value = false;

      //show success masseage
      AppPopups.showSuccessSnackBar(title: "Done Successfully", message: 'your order is done successfully');
    } catch (e) {
      AppLogger.warning("I have some error order");
      AppPopups.showErrorSnackBar(title: "oh oops", message: e.toString());
    } finally {
      loader.value = false;
    }
  }

  //save order
  Future<void> _saveOrder() async {
    var uuid = const Uuid();
    String id = uuid.v4();
    String userId = AuthenticationRepository.instance.authUser!.uid;
    UserModel currentUser = UserController.instance.currentUser.value;
    CartController cartController = Get.find();
    PaymentMethodsController paymentController = Get.find();
    AddressController addressController = Get.find();
    await _orderRepository.saveOrder(
      OrderModel(
        id: id,
        userId: userId,
        orderStatus: "Prossising",
        userName: currentUser.userName,
        userEmail: currentUser.email,
        items: cartController.cartItemsList,
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 15)),
        deliveryAddress: addressController.selectedUserAddress.value,
        paymentMethod: paymentController.selectedPaymentMethod['name'],
        orderTotalAmount: cartController.orderTotalAmount.value,
      ),
    );
    cartController.removeAllCartItems();
    Get.to(() => const LoadingScreen(loadWidget: Image(image: AssetImage(AppImages.sandWatchLoading))));
  }
}
