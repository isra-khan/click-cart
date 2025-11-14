import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: 16),
        centerTitle: true,
        backgroundColor: ColorConstraint.backgroundColor,
        title: Text(
          'Mega Mall',
          style: TextStyle(
            color: ColorConstraint.buttonColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Icon(Icons.notifications_outlined),
          Icon(Icons.shopping_cart_outlined),
        ],
      ),
      body: Column(
        children: [
          Container(
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
                                'assets/images/product1.png',
                                height: 400,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // ==== DISCOUNT TAG ====
                          if (2 > 0)
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
                                  '${(2 * 100).toStringAsFixed(0)}%',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium!,
                                ),
                              ),
                            ),

                          // ==== FAVORITE ICON ====
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.favorite,

                                  color: Colors.red,
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
                            'TMA-2HD Wireless',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 9),

                          // Price in Red
                          Text(
                            'Rs ${24440}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),

                          const SizedBox(height: 10),

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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '86 Reviews',
                                    style: TextStyle(
                                      color: ColorConstraint.primaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Divider(),
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/images/product.png'),
                    ),
                    Column(
                      children: [
                        Text(
                          'Shop Larson Electronic',
                          style: TextStyle(color: ColorConstraint.primaryColor),
                        ),
                        Text('Official Store'),
                      ],
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
