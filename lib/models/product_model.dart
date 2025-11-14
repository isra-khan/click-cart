// models/product_model.dart
class ProductModel {
  final String name;
  final String brand;
  final String imageUrl;
  final double price;
  final double discount; // e.g. 0.49 means 49%
  final bool isFavorite;

  ProductModel({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.price,
    this.discount = 0.0,
    this.isFavorite = false,
  });
}
