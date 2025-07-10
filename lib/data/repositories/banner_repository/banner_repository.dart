import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../models/banners/banners_model.dart';
import '../../services/firebase_storage_services.dart';

class BannerRepository extends GetxController {
  //instanc creator
  static BannerRepository get instance => Get.find();

  //firestore instance
  final _db = FirebaseFirestore.instance;

  //fatch banners
  Future<List<BannerModel>> getBanners() async {
    try {
      final snap = await _db.collection("Banners").get();
      final list = snap.docs.map((document) => BannerModel.fromSnapshotDocument(document)).toList();
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

  //----------------------------------------------------------------------------------------//
  //upload categories to the cloud firestore
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(FireBaseStorageServices());
      for (var item in banners) {
        final file = await storage.getImageDataFromAssets(item.imageUrl);
        final url = await storage.uploadImageData("Banners", file, item.imageUrl);
        item.imageUrl = url;
        await _db.collection("Banners").doc().set(item.toJson());
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
