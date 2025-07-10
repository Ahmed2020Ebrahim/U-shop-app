import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../models/brand/brand_model.dart';

class BrandRepository extends GetxController {
  // instance creator
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //fatch brands
  Future<List<BrandModel>> getBrands() async {
    try {
      final snap = await _db.collection("Brands").get();
      final list = snap.docs.map((document) => BrandModel.fromSnapshotDocument(document)).toList();
      return list;
    } on FirebaseAuthException catch (_) {
      throw "FirebaseAuthExeption has been throwen";
    } on FirebaseException catch (_) {
      throw "FirebaseException has been throwen";
    } on FormatException catch (_) {
      throw "FormatException has been throwen";
    } on PlatformException catch (_) {
      throw "PlatformException has been throwen";
    } catch (e) {
      throw "Something went wrong , please try again";
    }
  }

  //fatch spacific brand

  //----------------------------------------------------------------------------------------//
  //upload categories to the cloud firestore
  Future<void> uploadDummyData(List<BrandModel> banners) async {
    try {
      // final storage = Get.put(FireBaseStorageServices());
      for (var item in banners) {
        // final file = await storage.getImageDataFromAssets(item.imageUrl);
        // final url = await storage.uploadImageData("Banners", file, item.imageUrl);
        // item.imageUrl = url;
        await _db.collection("Brands").doc(item.id).set(item.toJson());
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
      throw "Something went wrong , please try again";
    }
  }
}
