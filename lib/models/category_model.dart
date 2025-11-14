// category.dart
import 'dart:ui';

class Category {
  final String id;
  final String title;
  final String imageUrl;
  final String? description;
  final DateTime? createdAt;
  Color color;

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.createdAt,
    this.color = const Color(0xFFFFFFFF),
  });

  Category copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? description,
    DateTime? createdAt,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      if (description != null) 'description': description,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }
}
