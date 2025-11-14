// models/product_model.dart
class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String imageUrl;
  final double price;
  final double discount; // e.g. 0.49 means 49%
  final bool isFavorite;
  final String? description;
  final int? stockQuantity;
  final double? rating; // Average rating (e.g., 4.6)
  final int? reviewCount; // Total number of reviews
  final String? shopId; // Reference to shop/store

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.price,
    this.discount = 0.0,
    this.isFavorite = false,
    this.description,
    this.stockQuantity,
    this.rating,
    this.reviewCount,
    this.shopId,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? brand,
    String? imageUrl,
    double? price,
    double? discount,
    bool? isFavorite,
    String? description,
    int? stockQuantity,
    double? rating,
    int? reviewCount,
    String? shopId,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      shopId: shopId ?? this.shopId,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      description: json['description'] as String?,
      stockQuantity: json['stockQuantity'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: json['reviewCount'] as int?,
      shopId: json['shopId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'imageUrl': imageUrl,
      'price': price,
      'discount': discount,
      'isFavorite': isFavorite,
      if (description != null) 'description': description,
      if (stockQuantity != null) 'stockQuantity': stockQuantity,
      if (rating != null) 'rating': rating,
      if (reviewCount != null) 'reviewCount': reviewCount,
      if (shopId != null) 'shopId': shopId,
    };
  }
}
