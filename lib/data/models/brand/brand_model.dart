import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String id;
  String imageUrl;
  bool isFeatured;
  final String name;
  final int productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.productsCount,
    required this.imageUrl,
    required this.isFeatured,
  });

  //empty banner model
  static BrandModel emptyBrandModel() => BrandModel(id: "", name: "", productsCount: 0, imageUrl: "", isFeatured: false);

  //from json
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      imageUrl: json['image'] ?? "",
      productsCount: json['productsCount'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
    );
  }
  //to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'productsCount': productsCount,
        'imageUrl': imageUrl,
        "isFeatured": isFeatured,
      };

  // from snapshot
  factory BrandModel.fromSnapshotDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: data['id'] ?? "",
        name: data['name'] ?? "",
        imageUrl: data['imageUrl'] ?? "",
        productsCount: data['productsCount'] ?? 0,
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return emptyBrandModel();
    }
  }
}
