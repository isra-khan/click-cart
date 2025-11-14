// models/review_model.dart
class ReviewModel {
  final String id;
  final String reviewerName;
  final String? profileImageUrl;
  final int rating; // 1-5 stars
  final String reviewText;
  final DateTime reviewDate;
  final String? productId;

  ReviewModel({
    required this.id,
    required this.reviewerName,
    this.profileImageUrl,
    required this.rating,
    required this.reviewText,
    required this.reviewDate,
    this.productId,
  });

  // Helper method to format date as "X Minggu yang lalu", "X Bulan yang lalu", etc.
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(reviewDate);

    if (difference.inDays < 7) {
      return '${difference.inDays} Hari yang lalu';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks Minggu yang lalu';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months Bulan yang lalu';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years Tahun yang lalu';
    }
  }

  ReviewModel copyWith({
    String? id,
    String? reviewerName,
    String? profileImageUrl,
    int? rating,
    String? reviewText,
    DateTime? reviewDate,
    String? productId,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      reviewerName: reviewerName ?? this.reviewerName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
      reviewDate: reviewDate ?? this.reviewDate,
      productId: productId ?? this.productId,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as String,
      reviewerName: json['reviewerName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      rating: json['rating'] as int,
      reviewText: json['reviewText'] as String,
      reviewDate: DateTime.parse(json['reviewDate'] as String),
      productId: json['productId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reviewerName': reviewerName,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      'rating': rating,
      'reviewText': reviewText,
      'reviewDate': reviewDate.toIso8601String(),
      if (productId != null) 'productId': productId,
    };
  }
}

