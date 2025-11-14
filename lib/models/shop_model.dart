// models/shop_model.dart
class ShopModel {
  final String id;
  final String name;
  final String? profileImageUrl;
  final bool isVerified;
  final String? type; // e.g., "Official Store"
  final String? description;
  final String? location; // e.g., "Jawa Barat, Bandung"
  final String? operatingHours; // e.g., "08:00-21:00"
  final int? followers; // Number of followers
  final int? productCount; // Number of products
  final DateTime? joinedDate; // When the shop joined
  final double? rating; // Shop rating (e.g., 4.6)

  ShopModel({
    required this.id,
    required this.name,
    this.profileImageUrl,
    this.isVerified = false,
    this.type,
    this.description,
    this.location,
    this.operatingHours,
    this.followers,
    this.productCount,
    this.joinedDate,
    this.rating,
  });

  ShopModel copyWith({
    String? id,
    String? name,
    String? profileImageUrl,
    bool? isVerified,
    String? type,
    String? description,
    String? location,
    String? operatingHours,
    int? followers,
    int? productCount,
    DateTime? joinedDate,
    double? rating,
  }) {
    return ShopModel(
      id: id ?? this.id,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isVerified: isVerified ?? this.isVerified,
      type: type ?? this.type,
      description: description ?? this.description,
      location: location ?? this.location,
      operatingHours: operatingHours ?? this.operatingHours,
      followers: followers ?? this.followers,
      productCount: productCount ?? this.productCount,
      joinedDate: joinedDate ?? this.joinedDate,
      rating: rating ?? this.rating,
    );
  }

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      type: json['type'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      operatingHours: json['operatingHours'] as String?,
      followers: json['followers'] as int?,
      productCount: json['productCount'] as int?,
      joinedDate: json['joinedDate'] != null
          ? DateTime.parse(json['joinedDate'] as String)
          : null,
      rating: (json['rating'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      'isVerified': isVerified,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (operatingHours != null) 'operatingHours': operatingHours,
      if (followers != null) 'followers': followers,
      if (productCount != null) 'productCount': productCount,
      if (joinedDate != null) 'joinedDate': joinedDate!.toIso8601String(),
      if (rating != null) 'rating': rating,
    };
  }

  // Helper method to format followers count (e.g., "23 Rb" for 23,000)
  String get formattedFollowers {
    if (followers == null) return '0';
    if (followers! >= 1000) {
      final rb = (followers! / 1000).toStringAsFixed(0);
      return '$rb Rb';
    }
    return followers.toString();
  }

  // Helper method to format joined date (e.g., "20 Okt 2021")
  String get formattedJoinedDate {
    if (joinedDate == null) return '';
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    return '${joinedDate!.day} ${months[joinedDate!.month - 1]} ${joinedDate!.year}';
  }
}

