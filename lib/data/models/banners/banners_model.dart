import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool isActive;

  BannerModel({required this.imageUrl, required this.targetScreen, required this.isActive});

  //empty banner model
  static BannerModel emptyBannerModel() => BannerModel(imageUrl: "", targetScreen: "", isActive: false);

  //from json
  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        imageUrl: json['imageUrl'],
        targetScreen: json['targetScreen'],
        isActive: json['isActive'] ?? false,
      );

  //to json
  Map<String, dynamic> toJson() => {'imageUrl': imageUrl, 'targetScreen': targetScreen, 'isActive': isActive};

  // from snapshot
  factory BannerModel.fromSnapshotDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BannerModel(
        imageUrl: data['imageUrl'] ?? "",
        targetScreen: data['targetScreen'] ?? "",
        isActive: data['isActive'] ?? false,
      );
    } else {
      return emptyBannerModel();
    }
  }
}
