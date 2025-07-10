// import 'package:u_shop_3/data/models/banners/banners_model.dart';
// import 'package:u_shop_3/data/models/category/category_model.dart';
// import 'package:u_shop_3/utils/constants/images.dart';

// import '../data/models/brand/brnad_model.dart';
// import '../data/models/products/product_model.dart';

// class DummyData {
//   //categories data
//   static final List<CategoryModel> categories = [
//     CategoryModel(id: "1", image: AppImages.sportsDark, name: "Sports", isFeatured: true),
//     CategoryModel(id: "2", image: AppImages.furnitureIcon, name: "Furniture", isFeatured: true),
//     CategoryModel(id: "3", image: AppImages.electronicsIcon, name: "Electronics", isFeatured: true),
//     CategoryModel(id: "4", image: AppImages.clothesIcon, name: "Clothes", isFeatured: true),
//     CategoryModel(id: "5", image: AppImages.animalIcon, name: "Animals", isFeatured: true),
//     CategoryModel(id: "6", image: AppImages.shoeIcon, name: "Shoes", isFeatured: true),
//     CategoryModel(id: "7", image: AppImages.cosmeticsIcon, name: "Cosmetics", isFeatured: true),
//     CategoryModel(id: "8", image: AppImages.jeweleryIcon, name: "Jewelery", isFeatured: true),

//     //
//     CategoryModel(id: "9", image: AppImages.sportsDark, name: "Sport Shoes", parentId: "1", isFeatured: false),
//     CategoryModel(id: "10", image: AppImages.sportsDark, name: "Track Suits", parentId: "1", isFeatured: false),
//     CategoryModel(id: "11", image: AppImages.sportsDark, name: "Sports Equipments", parentId: "1", isFeatured: false),

//     //
//     CategoryModel(id: "12", image: AppImages.furnitureIcon, name: "Bedroom Furniture", parentId: "5", isFeatured: false),
//     CategoryModel(id: "13", image: AppImages.furnitureIcon, name: "Kitchen Furniture", parentId: "5", isFeatured: false),
//     CategoryModel(id: "14", image: AppImages.furnitureIcon, name: "Office Furniture", parentId: "5", isFeatured: false),

//     CategoryModel(id: "15", image: AppImages.electronicsIcon, name: "Laptop", parentId: "2", isFeatured: false),
//     CategoryModel(id: "16", image: AppImages.electronicsIcon, name: "Mobile", parentId: "2", isFeatured: false),

//     CategoryModel(id: "16", image: AppImages.clothesIcon, name: "Shirts", parentId: "3", isFeatured: false),
//   ];

//   //banners data
//   static final List<BannerModel> banners = [
//     BannerModel(imageUrl: AppImages.banner1, targetScreen: "/category", isActive: false),
//     BannerModel(imageUrl: AppImages.banner2, targetScreen: "targetScreen", isActive: true),
//     BannerModel(imageUrl: AppImages.banner3, targetScreen: "targetScreen", isActive: true),
//     BannerModel(imageUrl: AppImages.banner4, targetScreen: "targetScreen", isActive: true),
//     BannerModel(imageUrl: AppImages.banner5, targetScreen: "targetScreen", isActive: true),
//     BannerModel(imageUrl: AppImages.banner6, targetScreen: "targetScreen", isActive: true),
//     BannerModel(imageUrl: AppImages.banner7, targetScreen: "targetScreen", isActive: false),
//   ];

//   //brands data
//   static final List<BrandModel> brands = [
//     BrandModel(id: "br1", name: "Acer", productsCount: 7, imageUrl: AppImages.acerLight, isFeatured: false),
//     BrandModel(id: "br2", name: "Adidas", productsCount: 11, imageUrl: AppImages.adidasLight, isFeatured: true),
//     BrandModel(id: "br3", name: "Apple", productsCount: 5, imageUrl: AppImages.appleLight, isFeatured: true),
//     BrandModel(id: "br4", name: "Castlery", productsCount: 4, imageUrl: AppImages.castleryLight, isFeatured: false),
//     BrandModel(id: "br5", name: "Huawei", productsCount: 10, imageUrl: AppImages.huaweiLight, isFeatured: false),
//     BrandModel(id: "br6", name: "IKEA", productsCount: 5, imageUrl: AppImages.ikeaLight, isFeatured: false),
//     BrandModel(id: "br7", name: "Nike", productsCount: 10, imageUrl: AppImages.nikeLight, isFeatured: true),
//     BrandModel(id: "br8", name: "Puma", productsCount: 8, imageUrl: AppImages.pumaLight, isFeatured: false),
//     BrandModel(id: "br9", name: "Samsung", productsCount: 11, imageUrl: AppImages.samsungLight, isFeatured: false),
//     BrandModel(id: "br10", name: "Zara", productsCount: 9, imageUrl: AppImages.zaraLight, isFeatured: true),

//     // //animals brands
//     // BrandModel(id: "br10", name: "Royal Canin", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//     // BrandModel(id: "br11", name: "Purina", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//     // //jewelery brnads
//     // BrandModel(id: "br12", name: "Tiffany & Co", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//     // BrandModel(id: "br13", name: "Cartier", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//     // BrandModel(id: "br14", name: "Mejuri", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//     // //cosmetics brands
//     // BrandModel(id: "br15", name: "MAC Cosmetics", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//     // BrandModel(id: "br16", name: "Estée Lauder", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//     // BrandModel(id: "br17", name: "NARS", productsCount: productsCount, imageUrl: imageUrl, isFeatured: isFeatured),
//   ];

//   static List<Product> products = [
//     //acer
//     Product(
//       brand: {
//         'id': 'br1',
//         'image': AppImages.acerLight,
//         'name': 'Acer',
//         'isFeatured': false,
//         'productsCount': 7,
//       },
//       categoryId: 'electronics',
//       description: 'Smart watch with multiple features.',
//       images: [],
//       isFeatured: true,
//       price: 399.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['blue', 'red', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['38mm', '42mm']
//         },
//       ],
//       productType: 'smart watch',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': '38mm'},
//           'description': 'blue smart watch, 83mm',
//           'id': 'v5',
//           'image': "",
//           'price': 399.0,
//           'sku': 'SWT-BLK-42',
//           'salePrice': 350.0,
//           'stock': 25,
//         }
//       ],
//       sku: 'SWT-BLK',
//       salePrice: 350.0,
//       stock: 25.0,
//       thumbnail: "imageUrls[4]",
//       title: 'Smart Watch',
//     ),
//     Product(
//       brand: {
//         'id': 'br1',
//         'image': AppImages.acerLight,
//         'name': 'Acer',
//         'isFeatured': false,
//         'productsCount': 7,
//       },
//       categoryId: 'electronics',
//       description: 'Smart watch with multiple features.',
//       images: [],
//       isFeatured: false,
//       price: 300.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['white', 'green', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['38mm', '42mm']
//         },
//       ],
//       productType: 'smart watch',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'pink', 'size': '38mm'},
//           'description': 'pink smart watch, 83mm',
//           'id': 'v6',
//           'image': "",
//           'price': 300.0,
//           'sku': 'SWT-BLK-42',
//           'salePrice': 280.0,
//           'stock': 30,
//         }
//       ],
//       sku: 'SWT-BLK',
//       salePrice: 350.0,
//       stock: 25.0,
//       thumbnail: "imageUrls[4]",
//       title: 'Smart Watch',
//     ),
//     Product(
//       brand: {
//         'id': 'br1',
//         'image': AppImages.acerLight,
//         'name': 'Acer',
//         'isFeatured': false,
//         'productsCount': 7,
//       },
//       categoryId: 'electronics',
//       description: 'Smart watch with multiple features.',
//       images: [],
//       isFeatured: false,
//       price: 300.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['white', 'green', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['38mm', '42mm']
//         },
//       ],
//       productType: 'smart watch',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'pink', 'size': '38mm'},
//           'description': 'pink smart watch, 83mm',
//           'id': 'v6',
//           'image': "",
//           'price': 300.0,
//           'sku': 'SWT-BLK-42',
//           'salePrice': 280.0,
//           'stock': 30,
//         }
//       ],
//       sku: 'SWT-BLK',
//       salePrice: 350.0,
//       stock: 25.0,
//       thumbnail: "imageUrls[4]",
//       title: 'Smart Watch',
//     ),
//     Product(
//       brand: {
//         'id': 'br1',
//         'image': AppImages.acerLight,
//         'name': 'Acer',
//         'isFeatured': false,
//         'productsCount': 7,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1200.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Silver laptop, 15"',
//           'id': 'v3',
//           'image': "imageUrls[2]",
//           'price': 1200.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1100.0,
//       stock: 15.0,
//       thumbnail: "imageUrls[2]",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br1',
//         'image': AppImages.acerLight,
//         'name': 'Acer',
//         'isFeatured': false,
//         'productsCount': 7,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: false,
//       price: 1100.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Silver laptop, 15"',
//           'id': 'v3',
//           'image': "imageUrls[2]",
//           'price': 1200.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 900.0,
//       stock: 15.0,
//       thumbnail: "imageUrls[2]",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br1',
//         'image': AppImages.acerLight,
//         'name': 'Acer',
//         'isFeatured': false,
//         'productsCount': 7,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 1100.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 1100.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 944.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 944.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br1',
//         'image': 'https://example.com/brand8.png',
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 15,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 999.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 999.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 950.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 950.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),

//     //adidas
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable adidas training.',
//       images: [],
//       isFeatured: false,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'green']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'training',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'green', 'size': 'M'},
//           'description': 'green running training, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running trainign',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable adidas training.',
//       images: [],
//       isFeatured: true,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'green']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'training',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'blue running training, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Blue Traingin',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable adidas training.',
//       images: [],
//       isFeatured: true,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'green']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'training',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'blue running training, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Blue Traingin',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'footwear',
//       description: 'Stylish running shoe.',
//       images: [],
//       isFeatured: true,
//       price: 120.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['red', 'blue', 'black', "white"]
//         },
//         {
//           'name': 'sizes',
//           'values': ['8', '9', '10', '11']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'red', 'size': '10'},
//           'description': 'White running shoe, size 10',
//           'id': 'v7',
//           'image': "",
//           'price': 120.0,
//           'sku': 'SHO-RED-10',
//           'salePrice': 110.0,
//           'stock': 40,
//         }
//       ],
//       sku: 'SHO-RED',
//       salePrice: 110.0,
//       stock: 40.0,
//       thumbnail: "",
//       title: 'Running Shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'footwear',
//       description: 'Stylish running shoe.',
//       images: [],
//       isFeatured: true,
//       price: 120.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['red', 'blue', 'black', "white"]
//         },
//         {
//           'name': 'sizes',
//           'values': ['8', '9', '10', '11']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'red', 'size': '10'},
//           'description': 'Black running shoe, size 10',
//           'id': 'v7',
//           'image': "",
//           'price': 120.0,
//           'sku': 'SHO-RED-10',
//           'salePrice': 110.0,
//           'stock': 40,
//         }
//       ],
//       sku: 'SHO-RED',
//       salePrice: 110.0,
//       stock: 40.0,
//       thumbnail: "",
//       title: 'Running Shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'footwear',
//       description: 'Stylish running shoe.',
//       images: [],
//       isFeatured: true,
//       price: 120.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['red', 'blue', 'black', "white"]
//         },
//         {
//           'name': 'sizes',
//           'values': ['8', '9', '10', '11']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'red', 'size': '10'},
//           'description': 'White running shoe, size 10',
//           'id': 'v7',
//           'image': "",
//           'price': 120.0,
//           'sku': 'SHO-RED-10',
//           'salePrice': 110.0,
//           'stock': 40,
//         }
//       ],
//       sku: 'SHO-RED',
//       salePrice: 110.0,
//       stock: 40.0,
//       thumbnail: "",
//       title: 'Running Shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable running pant.',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'Black running pants, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running Pants',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable running pants.',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'red']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'Red running pants, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running Pants',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable running pants.',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'green']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'green running pants, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running Pants',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable training.',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'training',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'Black training from adidas, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 100.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 80.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 80.0,
//       stock: 30.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Comfortable Training',
//     ),
//     Product(
//       brand: {
//         'id': 'br2',
//         'image': AppImages.adidasLight,
//         'name': 'Adidas',
//         'isFeatured': true,
//         'productsCount': 11,
//       },
//       categoryId: 'clothing',
//       description: 'Stylish T-shirt for casual wear.',
//       images: [],
//       isFeatured: true,
//       price: 25.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['white', 'gray']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 't-shirt',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'white', 'size': 'L'},
//           'description': 'White T-shirt, size L',
//           'id': 'v2',
//           'image': "",
//           'price': 25.0,
//           'sku': 'TSH-WHT-L',
//           'salePrice': 20.0,
//           'stock': 50,
//         }
//       ],
//       sku: 'TSH-WHT',
//       salePrice: 20.0,
//       stock: 50.0,
//       thumbnail: "",
//       title: 'Casual T-shirt',
//     ),

//     // apple
//     Product(
//       brand: {
//         'id': 'br3',
//         'image': AppImages.appleLight,
//         'name': 'Apple',
//         'isFeatured': true,
//         'productsCount': 5,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1200.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Silver laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 1200.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1100.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br3',
//         'image': AppImages.appleLight,
//         'name': 'Apple',
//         'isFeatured': true,
//         'productsCount': 5,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 3000.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 3000.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 2800.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 2800.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br3',
//         'image': AppImages.appleLight,
//         'name': 'Apple',
//         'isFeatured': true,
//         'productsCount': 5,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1200.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 1200.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1100.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br3',
//         'image': AppImages.appleLight,
//         'name': 'Apple',
//         'isFeatured': true,
//         'productsCount': 5,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 999.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 999.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 950.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 950.0,
//       stock: 35.0,
//       thumbnail: "imageUrls[7]",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br3',
//         'image': AppImages.appleLight,
//         'name': 'Apple',
//         'isFeatured': true,
//         'productsCount': 5,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 849.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 849.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 749.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 749.0,
//       stock: 35.0,
//       thumbnail: "imageUrls[7]",
//       title: 'Smartphone',
//     ),

//     //castlery
//     Product(
//       brand: {
//         'id': 'br4',
//         'image': AppImages.castleryLight,
//         'name': 'Castlery',
//         'isFeatured': false,
//         'productsCount': 4,
//       },
//       categoryId: 'furniture',
//       description: 'Sturdy sofa for home or office.',
//       images: [],
//       isFeatured: true,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'sofa',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'Brown sofa, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful sofa',
//     ),
//     Product(
//       brand: {
//         'id': 'br4',
//         'image': AppImages.castleryLight,
//         'name': 'Castlery',
//         'isFeatured': false,
//         'productsCount': 4,
//       },
//       categoryId: 'furniture',
//       description: 'comfortable bed for home.',
//       images: [],
//       isFeatured: true,
//       price: 599.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'bed',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'Brown bed, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 599.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 500.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 500.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'comfortable bed',
//     ),
//     Product(
//       brand: {
//         'id': 'br4',
//         'image': AppImages.castleryLight,
//         'name': 'Castlery',
//         'isFeatured': false,
//         'productsCount': 4,
//       },
//       categoryId: 'furniture',
//       description: 'Sturdy wooden desk for home or office.',
//       images: [],
//       isFeatured: true,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'desk',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'Brown desk, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful desk',
//     ),
//     Product(
//       brand: {
//         'id': 'br4',
//         'image': AppImages.castleryLight,
//         'name': 'Castlery',
//         'isFeatured': false,
//         'productsCount': 4,
//       },
//       categoryId: 'furniture',
//       description: 'Sturdy sofa for home or office.',
//       images: [],
//       isFeatured: true,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'sofa',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'white', 'size': 'medium'},
//           'description': 'white sofa, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful sofa',
//     ),

//     //huawei
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: false,
//       price: 999.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 999.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 950.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 950.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 1000.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 999.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 960.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 960.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 1200.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 1200.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 1100.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 1100.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: false,
//       price: 999.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 999.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 950.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 950.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1200.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 1200.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1100.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1500.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 1500.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1100.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 2000.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 2000.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1900.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1900.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1600.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 1600.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1500.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1500.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 2500.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 2500.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 2400.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 2400.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Smart TV with crystal-clear display.',
//       images: [],
//       isFeatured: true,
//       price: 800.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['42"', '55"', '65"']
//         },
//       ],
//       productType: 'smart tv',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': '55"'},
//           'description': 'Black Smart TV, 55"',
//           'id': 'v4',
//           'image': "",
//           'price': 800.0,
//           'sku': 'TV-BLK-55',
//           'salePrice': 750.0,
//           'stock': 10,
//         }
//       ],
//       sku: 'TV-BLK',
//       salePrice: 750.0,
//       stock: 10.0,
//       thumbnail: "",
//       title: 'Smart TV',
//     ),
//     Product(
//       brand: {
//         'id': 'br5',
//         'image': AppImages.huaweiLight,
//         'name': 'Huawei',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Smart watch with multiple features.',
//       images: [],
//       isFeatured: true,
//       price: 399.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['blue', 'red', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['38mm', '42mm']
//         },
//       ],
//       productType: 'smart watch',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': '38mm'},
//           'description': 'blue smart watch, 83mm',
//           'id': 'v5',
//           'image': "",
//           'price': 399.0,
//           'sku': 'SWT-BLK-42',
//           'salePrice': 350.0,
//           'stock': 25,
//         }
//       ],
//       sku: 'SWT-BLK',
//       salePrice: 350.0,
//       stock: 25.0,
//       thumbnail: "imageUrls[4]",
//       title: 'Smart Watch',
//     ),

//     //IKEA
//     Product(
//       brand: {
//         'id': 'br6',
//         'image': AppImages.ikeaLight,
//         'name': 'IKEA',
//         'isFeatured': false,
//         'productsCount': 5,
//       },
//       categoryId: 'furniture',
//       description: 'Cupboard clothes for home.',
//       images: [],
//       isFeatured: false,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'Cupboard clothes',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'white Cupboard clothes, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful sofa',
//     ),
//     Product(
//       brand: {
//         'id': 'br6',
//         'image': AppImages.ikeaLight,
//         'name': 'IKEA',
//         'isFeatured': false,
//         'productsCount': 5,
//       },
//       categoryId: 'furniture',
//       description: 'Cupboard clothes for home.',
//       images: [],
//       isFeatured: true,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'Cupboard clothes',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'white Cupboard clothes, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful sofa',
//     ),
//     Product(
//       brand: {
//         'id': 'br6',
//         'image': AppImages.ikeaLight,
//         'name': 'IKEA',
//         'isFeatured': false,
//         'productsCount': 5,
//       },
//       categoryId: 'furniture',
//       description: 'Sturdy sofa for home or office.',
//       images: [],
//       isFeatured: false,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'sofa',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'Brown sofa, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful sofa',
//     ),
//     Product(
//       brand: {
//         'id': 'br6',
//         'image': AppImages.ikeaLight,
//         'name': 'IKEA',
//         'isFeatured': false,
//         'productsCount': 5,
//       },
//       categoryId: 'furniture',
//       description: 'beautiful Lampshades.',
//       images: [],
//       isFeatured: true,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'Lampshades',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'beatiful Lampshades, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful Lampshades',
//     ),
//     Product(
//       brand: {
//         'id': 'br6',
//         'image': AppImages.ikeaLight,
//         'name': 'IKEA',
//         'isFeatured': false,
//         'productsCount': 5,
//       },
//       categoryId: 'furniture',
//       description: 'Cupboard clothes for home.',
//       images: [],
//       isFeatured: false,
//       price: 150.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['brown', 'black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['small', 'medium', 'large']
//         },
//       ],
//       productType: 'Cupboard clothes',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'medium'},
//           'description': 'white Cupboard clothes, medium size',
//           'id': 'v9',
//           'image': "",
//           'price': 150.0,
//           'sku': 'DSK-BRN-MED',
//           'salePrice': 140.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'DSK-BRN',
//       salePrice: 140.0,
//       stock: 20.0,
//       thumbnail: "",
//       title: 'beautiful sofa',
//     ),

//     //nike
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable running shoe.',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'white running shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'beautiful shoe.',
//       images: [],
//       isFeatured: true,
//       price: 60.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'black running shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 60.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 55.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 55.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable running shoe.',
//       images: [],
//       isFeatured: false,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'white running shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable jacket .',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'jacket',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'black jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'jacket for running',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable t-shirt .',
//       images: [],
//       isFeatured: false,
//       price: 44.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'T-shirt',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'white t-shirt , size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 44.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 40.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 40.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Nike T-shirt',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'beautiful green t-shirt .',
//       images: [],
//       isFeatured: false,
//       price: 44.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'green']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'T-shirt',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'green', 'size': 'M'},
//           'description': 'white t-shirt , size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 44.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 40.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 40.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Nike T-shirt',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable pant .',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'black pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'pant for running',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable pant .',
//       images: [],
//       isFeatured: false,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'black pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'pant for running',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'running pant .',
//       images: [],
//       isFeatured: true,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'jacket',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'black pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 60.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 60.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'pant for running',
//     ),
//     Product(
//       brand: {
//         'id': 'br7',
//         'image': AppImages.nikeLight,
//         'name': 'Nike',
//         'isFeatured': true,
//         'productsCount': 10,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable jacket .',
//       images: [],
//       isFeatured: false,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'jacket',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': 'M'},
//           'description': 'black jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'jacket for running',
//     ),

//     //puma
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable running shoe.',
//       images: [],
//       isFeatured: true,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'red']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'red', 'size': 'M'},
//           'description': 'red running shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 60.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 60.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'beautiful running shoe.',
//       images: [],
//       isFeatured: true,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'white']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'white', 'size': 'M'},
//           'description': 'white running shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 70.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 70.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Puma running shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'great running shoe.',
//       images: [],
//       isFeatured: true,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'blue running shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 60.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 60.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Running shoe',
//     ),
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'great jacket.',
//       images: [],
//       isFeatured: true,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'beautiful jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 60.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 60.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'puma jacket',
//     ),
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'mancity jacket.',
//       images: [],
//       isFeatured: true,
//       price: 90.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'beautiful jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 90.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 80.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 80.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'Mancity jacket',
//     ),
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'great jacket.',
//       images: [],
//       isFeatured: false,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'beautiful jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 60.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 60.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'puma jacket',
//     ),
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'great pant.',
//       images: [],
//       isFeatured: false,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'beautiful pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 60.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 60.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'puma pant',
//     ),
//     Product(
//       brand: {
//         'id': 'br8',
//         'image': AppImages.pumaLight,
//         'name': 'Puma',
//         'isFeatured': false,
//         'productsCount': 8,
//       },
//       categoryId: 'clothing',
//       description: 'great pant.',
//       images: [],
//       isFeatured: true,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'blue', 'blue']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': 'M'},
//           'description': 'beautiful pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 60.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 60.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'puma pant',
//     ),

//     //samsung
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 999.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 999.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 950.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 950.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: false,
//       price: 1000.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 1000.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 990.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 990.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Latest model smartphone with advanced features.',
//       images: [],
//       isFeatured: true,
//       price: 1200.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'white', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['128GB', '256GB']
//         },
//       ],
//       productType: 'phone',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'gold', 'size': '256GB'},
//           'description': 'Gold smartphone, 256GB',
//           'id': 'v8',
//           'image': "",
//           'price': 1200.0,
//           'sku': 'PHN-GLD-256',
//           'salePrice': 1100.0,
//           'stock': 35,
//         }
//       ],
//       sku: 'PHN-GLD',
//       salePrice: 1100.0,
//       stock: 35.0,
//       thumbnail: "",
//       title: 'Smartphone',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Smart TV with crystal-clear display.',
//       images: [],
//       isFeatured: true,
//       price: 800.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['42"', '55"', '65"']
//         },
//       ],
//       productType: 'smart tv',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': '55"'},
//           'description': 'Black Smart TV, 55"',
//           'id': 'v4',
//           'image': "",
//           'price': 800.0,
//           'sku': 'TV-BLK-55',
//           'salePrice': 750.0,
//           'stock': 10,
//         }
//       ],
//       sku: 'TV-BLK',
//       salePrice: 750.0,
//       stock: 10.0,
//       thumbnail: "",
//       title: 'Smart TV',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Smart TV with crystal-clear display.',
//       images: [],
//       isFeatured: true,
//       price: 800.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black']
//         },
//         {
//           'name': 'sizes',
//           'values': ['42"', '55"', '65"']
//         },
//       ],
//       productType: 'smart tv',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'black', 'size': '55"'},
//           'description': 'Black Smart TV, 55"',
//           'id': 'v4',
//           'image': "",
//           'price': 800.0,
//           'sku': 'TV-BLK-55',
//           'salePrice': 750.0,
//           'stock': 10,
//         }
//       ],
//       sku: 'TV-BLK',
//       salePrice: 750.0,
//       stock: 10.0,
//       thumbnail: "",
//       title: 'Smart TV',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Smart watch with multiple features.',
//       images: [],
//       isFeatured: true,
//       price: 399.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['blue', 'red', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['38mm', '42mm']
//         },
//       ],
//       productType: 'smart watch',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': '38mm'},
//           'description': 'blue smart watch, 83mm',
//           'id': 'v5',
//           'image': "",
//           'price': 399.0,
//           'sku': 'SWT-BLK-42',
//           'salePrice': 350.0,
//           'stock': 25,
//         }
//       ],
//       sku: 'SWT-BLK',
//       salePrice: 350.0,
//       stock: 25.0,
//       thumbnail: "imageUrls[4]",
//       title: 'Smart Watch',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Smart watch with multiple features.',
//       images: [],
//       isFeatured: false,
//       price: 399.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['blue', 'red', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['38mm', '42mm']
//         },
//       ],
//       productType: 'smart watch',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': '38mm'},
//           'description': 'blue smart watch, 83mm',
//           'id': 'v5',
//           'image': "",
//           'price': 399.0,
//           'sku': 'SWT-BLK-42',
//           'salePrice': 350.0,
//           'stock': 25,
//         }
//       ],
//       sku: 'SWT-BLK',
//       salePrice: 350.0,
//       stock: 25.0,
//       thumbnail: "imageUrls[4]",
//       title: 'Smart Watch',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'Smart watch with multiple features.',
//       images: [],
//       isFeatured: true,
//       price: 400.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['blue', 'red', 'gold']
//         },
//         {
//           'name': 'sizes',
//           'values': ['38mm', '42mm']
//         },
//       ],
//       productType: 'smart watch',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'blue', 'size': '38mm'},
//           'description': 'blue smart watch, 83mm',
//           'id': 'v5',
//           'image': "",
//           'price': 400.0,
//           'sku': 'SWT-BLK-42',
//           'salePrice': 360.0,
//           'stock': 25,
//         }
//       ],
//       sku: 'SWT-BLK',
//       salePrice: 360.0,
//       stock: 25.0,
//       thumbnail: "imageUrls[4]",
//       title: 'Smart Watch',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1200.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 1200.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1100.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 1500.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 1500.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1100.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1100.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),
//     Product(
//       brand: {
//         'id': 'br9',
//         'image': AppImages.samsungLight,
//         'name': 'Samsung',
//         'isFeatured': false,
//         'productsCount': 11,
//       },
//       categoryId: 'electronics',
//       description: 'High-performance laptop for work and play.',
//       images: [],
//       isFeatured: true,
//       price: 2000.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['silver', 'black', 'pink']
//         },
//         {
//           'name': 'sizes',
//           'values': ['13"', '15"', '17"']
//         },
//       ],
//       productType: 'laptop',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'silver', 'size': '15"'},
//           'description': 'Pink laptop, 15"',
//           'id': 'v3',
//           'image': "",
//           'price': 2000.0,
//           'sku': 'LPT-SLV-15',
//           'salePrice': 1900.0,
//           'stock': 15,
//         }
//       ],
//       sku: 'LPT-SLV',
//       salePrice: 1900.0,
//       stock: 15.0,
//       thumbnail: "",
//       title: 'Performance Laptop',
//     ),

//     //zara
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable pant.',
//       images: [],
//       isFeatured: true,
//       price: 55.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'brown pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 55.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 50.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 50.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable Pants',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable pant.',
//       images: [],
//       isFeatured: true,
//       price: 60.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'brown pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 60.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 55.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 55.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable Pants',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable pant.',
//       images: [],
//       isFeatured: true,
//       price: 70.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'brown pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 70.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 65.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 65.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable Pants',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable pant.',
//       images: [],
//       isFeatured: true,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'pant',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'brown pant, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 70.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 70.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable Pants',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable jacket.',
//       images: [],
//       isFeatured: true,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'jacket',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'great jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 70.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 70.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable jacket',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable jacket.',
//       images: [],
//       isFeatured: true,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'jacket',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'great jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 70.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 70.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable jacket',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable jacket.',
//       images: [],
//       isFeatured: false,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'jacket',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'great jacket, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 70.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 70.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable jacket',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable shoe.',
//       images: [],
//       isFeatured: false,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'great shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 70.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 70.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable show',
//     ),
//     Product(
//       brand: {
//         'id': 'br10',
//         'image': AppImages.zaraLight,
//         'name': 'Zara',
//         'isFeatured': true,
//         'productsCount': 9,
//       },
//       categoryId: 'clothing',
//       description: 'Comfortable shoe.',
//       images: [],
//       isFeatured: true,
//       price: 80.0,
//       productAttributes: [
//         {
//           'name': 'colors',
//           'values': ['black', 'brown']
//         },
//         {
//           'name': 'sizes',
//           'values': ['S', 'M', 'L', 'XL']
//         },
//       ],
//       productType: 'shoe',
//       productVariations: [
//         {
//           'attributeValues': {'color': 'brown', 'size': 'M'},
//           'description': 'great shoe, size M',
//           'id': 'v1',
//           'image': "imageUrls[0]",
//           'price': 80.0,
//           'sku': 'PNT-BLK-M',
//           'salePrice': 70.0,
//           'stock': 20,
//         }
//       ],
//       sku: 'PNT-BLK',
//       salePrice: 70.0,
//       stock: 20.0,
//       thumbnail: "imageUrls[0]",
//       title: 'comfortable show',
//     ),
//   ];

//   //products images list
//   static List<String> productsImages = [
//     AppImages.acer1,
//     AppImages.acer2,
//     AppImages.acer3,
//     AppImages.acer4,
//     AppImages.acer5,
//     AppImages.acer6,
//     AppImages.acer7,
//     AppImages.adidas1,
//     AppImages.adidas2,
//     AppImages.adidas3,
//     AppImages.adidas4,
//     AppImages.adidas5,
//     AppImages.adidas6,
//     AppImages.adidas7,
//     AppImages.adidas8,
//     AppImages.adidas9,
//     AppImages.adidas10,
//     AppImages.adidas11,
//     AppImages.apple1,
//     AppImages.apple2,
//     AppImages.apple3,
//     AppImages.apple4,
//     AppImages.apple5,
//     AppImages.castlery1,
//     AppImages.castlery2,
//     AppImages.castlery3,
//     AppImages.castlery4,
//     AppImages.huawei1,
//     AppImages.huawei2,
//     AppImages.huawei3,
//     AppImages.huawei4,
//     AppImages.huawei5,
//     AppImages.huawei6,
//     AppImages.huawei7,
//     AppImages.huawei8,
//     AppImages.huawei9,
//     AppImages.huawei10,
//     AppImages.huawei11,
//     AppImages.ikea1,
//     AppImages.ikea2,
//     AppImages.ikea3,
//     AppImages.ikea4,
//     AppImages.ikea5,
//     AppImages.nike1,
//     AppImages.nike2,
//     AppImages.nike3,
//     AppImages.nike4,
//     AppImages.nike5,
//     AppImages.nike6,
//     AppImages.nike7,
//     AppImages.nike8,
//     AppImages.nike9,
//     AppImages.nike10,
//     AppImages.puma1,
//     AppImages.puma2,
//     AppImages.puma3,
//     AppImages.puma4,
//     AppImages.puma5,
//     AppImages.puma6,
//     AppImages.puma7,
//     AppImages.puma8,
//     AppImages.samsung1,
//     AppImages.samsung2,
//     AppImages.samsung3,
//     AppImages.samsung4,
//     AppImages.samsung5,
//     AppImages.samsung6,
//     AppImages.samsung7,
//     AppImages.samsung8,
//     AppImages.samsung9,
//     AppImages.samsung10,
//     AppImages.samsung11,
//     AppImages.zara1,
//     AppImages.zara2,
//     AppImages.zara3,
//     AppImages.zara4,
//     AppImages.zara5,
//     AppImages.zara6,
//     AppImages.zara7,
//     AppImages.zara8,
//     AppImages.zara9,
//   ];
// }
