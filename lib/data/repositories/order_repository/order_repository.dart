import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ushop/data/models/order/order_model.dart';
import 'package:ushop/data/repositories/authentication_repository/authentication_repository.dart';

class OrderRepository extends GetxController {
  //instance creator
  static OrderRepository get instance => Get.find();

  //data base instance
  final _db = FirebaseFirestore.instance;

  //fetch orders from database
  Future<List<OrderModel>> fetchOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final snapShot = await _db.collection("Users").doc(userId).collection("Orders").get();
      final data = snapShot.docs.map((order) {
        return OrderModel.fromSnapshot(order);
      }).toList();

      return data;
    } on FirebaseAuthException catch (_) {
      throw "FirebaseAuthExeption has been throwen";
    } on FirebaseException catch (_) {
      throw "FirebaseException has been throwen";
    } on FormatException catch (_) {
      throw "FormatException has been throwen";
    } on PlatformException catch (_) {
      throw "PlatformException has been throwen";
    } catch (e) {
      throw "some thing went wrong";
    }
  }

  //save order
  Future<void> saveOrder(OrderModel order) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection("Users").doc(userId).collection("Orders").add(order.toJson());
    } on FirebaseAuthException catch (_) {
      throw "FirebaseAuthExeption has been throwen";
    } on FirebaseException catch (_) {
      throw "FirebaseException has been throwen";
    } on FormatException catch (_) {
      throw "FormatException has been throwen";
    } on PlatformException catch (_) {
      throw "PlatformException has been throwen";
    } catch (e) {
      throw "some thing went wrong";
    }
  }

  //get order by id
  Future<OrderModel?> getOrderById(String orderId) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final docSnapshot = await _db.collection("Users").doc(userId).collection("Orders").doc(orderId).get();
      if (docSnapshot.exists) {
        return OrderModel.fromSnapshot(docSnapshot);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (_) {
      throw "FirebaseAuthExeption has been throwen";
    } on FirebaseException catch (_) {
      throw "FirebaseException has been throwen";
    } on FormatException catch (_) {
      throw "FormatException has been throwen";
    } on PlatformException catch (_) {
      throw "PlatformException has been throwen";
    } catch (e) {
      throw "some thing went wrong";
    }
  }
}
