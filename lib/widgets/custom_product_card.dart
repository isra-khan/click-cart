import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/models/product_model.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  const CustomProductCard({
    super.key,
    required this.product,
    this.onFavoriteToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstraint.backgroundColor,
        ),
        child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==== IMAGE SECTION ====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F0FE),
                      ), // soft blue background
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          product.imageUrl,
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // ==== DISCOUNT TAG ====
                    if (product.discount > 0)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${(product.discount * 100).toStringAsFixed(0)}%',
                            style: Theme.of(context).textTheme.labelMedium!,
                          ),
                        ),
                      ),

                    // ==== FAVORITE ICON ====
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onFavoriteToggle,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product.isFavorite
                                ? Colors.red
                                : Colors.black54,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ==== PRODUCT INFO ====
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),

                    // Brand & Verified Icon
                    Row(
                      children: [
                        Text(
                          product.brand,
                          style: Theme.of(context).textTheme.labelMedium!,
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 14,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Price in Red
                    Text(
                      'Rs ${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Rating & Reviews
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '86 Reviews',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ==== Add Button at bottom-right ====
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onFavoriteToggle,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: ColorConstraint.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
