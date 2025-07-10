import 'package:cloud_firestore/cloud_firestore.dart';
import '../brand/brand_model.dart';
import 'product_attributes_model.dart';
import 'product_variations_model.dart';

class Product {
  String id;
  BrandModel brand;
  String categoryId;
  String description;
  List<String> images;
  bool isFeatured;
  double price;
  List<ProductAttribute> productAttributes;
  String productType;
  List<ProductVariation> productVariations;
  String sku;
  double salePrice;
  double stock;
  String thumbnail;
  String title;

  Product({
    required this.id,
    required this.brand,
    required this.categoryId,
    required this.description,
    required this.images,
    required this.isFeatured,
    required this.price,
    required this.productAttributes,
    required this.productType,
    required this.productVariations,
    required this.sku,
    required this.salePrice,
    required this.stock,
    required this.thumbnail,
    required this.title,
  });

  // Empty product factory method
  factory Product.emptyProduct() {
    return Product(
      id: "",
      brand: BrandModel(
        id: '',
        imageUrl: '',
        name: '',
        isFeatured: false,
        productsCount: 0,
      ),
      categoryId: '',
      description: '',
      images: [],
      isFeatured: false,
      price: 0.0,
      productAttributes: [],
      productType: '',
      productVariations: [],
      sku: '',
      salePrice: 0.0,
      stock: 0.0,
      thumbnail: '',
      title: '',
    );
  }

  // Convert a Product from a map
  factory Product.fromJson(Map<String, dynamic> json, String productId) {
    return Product(
      id: productId,
      brand: BrandModel.fromJson(json['brand']),
      categoryId: json['categoryId'],
      description: json['description'],
      images: List<String>.from(json['images']),
      isFeatured: json['isFeatured'],
      price: json['price'],
      productAttributes: (json['productAttributes'] as List).map((item) => ProductAttribute.fromJson(item)).toList(),
      productType: json['productType'],
      productVariations: (json['productVariations'] as List).map((item) => ProductVariation.fromJson(item)).toList(),
      sku: json['sku'],
      salePrice: json['salePrice'],
      stock: json['stock'],
      thumbnail: json['thumbnail'],
      title: json['title'],
    );
  }

  // Convert a Product to a map
  Map<String, dynamic> toJson() {
    return {
      'brand': brand.toJson(),
      'categoryId': categoryId,
      'description': description,
      'images': images,
      'isFeatured': isFeatured,
      'price': price,
      'productAttributes': productAttributes.map((item) => item.toJson()).toList(),
      'productType': productType,
      'productVariations': productVariations.map((item) => item.toJson()).toList(),
      'sku': sku,
      'salePrice': salePrice,
      'stock': stock,
      'thumbnail': thumbnail,
      'title': title,
    };
  }

  // Convert a Product from a Firestore document snapshot
  factory Product.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    String id = snapshot.id;
    final data = snapshot.data() as Map<String, dynamic>;
    Product result = Product(
      id: id,
      brand: data['brand'] == null ? BrandModel.emptyBrandModel() : BrandModel.fromJson(data['brand']),
      categoryId: data['categoryId'] ?? "",
      description: data['description'] ?? "",
      images: data['images'] != null ? List.from(data['images']) : [],
      isFeatured: data['isFeatured'] ?? false,
      price: data['price'] ?? 0,
      productAttributes: data['productAttributes'] == null ? [] : (data['productAttributes'] as List).map((e) => ProductAttribute.fromJson(e)).toList(),
      productType: data['productType'] ?? "",
      productVariations: data['productVariations'] == null ? [] : (data['productVariations'] as List).map((e) => ProductVariation.fromJson(e)).toList(),
      sku: data['sku'] ?? "",
      salePrice: data['salePrice'] ?? 0,
      stock: data['stock'] ?? 0,
      thumbnail: data['thumbnail'] ?? "",
      title: data['title'] ?? "",
    );

    return result;
  }
}
