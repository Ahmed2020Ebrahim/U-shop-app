import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  List<dynamic>? subCategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = "",
    required this.isFeatured,
    required this.subCategories,
  });

  //
  static CategoryModel emptyCategoryModel() => CategoryModel(id: '', name: '', image: '', isFeatured: false, subCategories: []);

  //
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      image: json['image'] ?? "",
      parentId: json['parent_id'] ?? "",
      isFeatured: json['is_featured'] ?? false,
      subCategories: json['sub_categories'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'parent_id': parentId,
      'is_featured': isFeatured,
      'sub_categories': subCategories,
    };
  }

  factory CategoryModel.fromSnapshotDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['name'] ?? "",
        image: data['image'] ?? "",
        parentId: data['parent_id'] ?? "",
        isFeatured: data['is_featured'] ?? false,
        subCategories: data["sub_categories"],
      );
    } else {
      return emptyCategoryModel();
    }
  }
}
