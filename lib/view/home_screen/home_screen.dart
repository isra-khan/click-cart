import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/font_sizes.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/models/category_model.dart';
import 'package:hackathon_isra/view/home_screen/product_detail_page.dart';
import 'package:hackathon_isra/widgets/custom_product_card.dart';
import 'package:hackathon_isra/widgets/custom_searchbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:hackathon_isra/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController controller = TextEditingController();

  // Carousel banners
  final List<String> imgList = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  // Categories sample
  final List<Category> sampleCategories = [
    Category(
      id: 'c1',
      title: 'Food',
      imageUrl: 'assets/icons/eggs.png',
      description: 'Restaurants, recipes and groceries',
      createdAt: DateTime.now(),
      color: Colors.green.withOpacity(0.1),
    ),
    Category(
      id: 'c2',
      title: 'Gift',
      imageUrl: 'assets/icons/meat.png',
      description: 'Flights, hotels and trips',
      color: Colors.red.withOpacity(0.1),
    ),
    Category(
      id: 'c3',
      title: 'Fashion',
      imageUrl: 'assets/icons/eggs.png',
      description: 'Gadgets, phones, laptops',
      createdAt: DateTime.now(),
      color: Colors.yellow.withOpacity(0.1),
    ),
    Category(
      id: 'c4',
      title: 'Gadget',
      imageUrl: 'assets/icons/meat.png',
      description: 'Clothes, shoes and accessories',
      color: Colors.purple.withOpacity(0.1),
    ),
    Category(
      id: 'c5',
      title: 'Farm',
      imageUrl: 'assets/icons/meat2.png',
      description: 'Furniture, decor and tools',
      createdAt: DateTime.now(),
      color: Colors.green.withOpacity(0.1),
    ),
  ];

  // Sample products
  final List<ProductModel> sampleProducts = [
    ProductModel(
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 4444.5,
      discount: 0.1,
      imageUrl: 'assets/images/product1.png',
      isFavorite: false,
    ),
    ProductModel(
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 555.2,
      discount: 0,
      imageUrl: 'assets/images/product2.png',
      isFavorite: true,
    ),
    ProductModel(
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 455.0,
      discount: 0.2,
      imageUrl: 'assets/images/product2.png',
      isFavorite: false,
    ),
    ProductModel(
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 454545.0,
      discount: 0,
      imageUrl: 'assets/images/product2.png',
      isFavorite: false,
    ),
    ProductModel(
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 4555.0,
      discount: 0.05,
      imageUrl: 'assets/images/product2.png',
      isFavorite: true,
    ),
    ProductModel(
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 4555.0,
      discount: 0,
      imageUrl: 'assets/images/product2.png',
      isFavorite: false,
    ),
  ];

  // Sample banner images for products section
  final List<String> sampleBanners = [
    'assets/images/banner3.png',
    'assets/images/banner4.png',
  ];

  @override
  Widget build(BuildContext context) {
    Responsiveness.init(context);

    return Scaffold(
      backgroundColor: ColorConstraint.backgroundColor,
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- Search Bar ---
          CustomSearchBar(controller: controller, onChanged: (val) {}),
          const SizedBox(height: 20),

          // --- Carousel Slider ---
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
            items: imgList.map((item) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // --- Categories ---
          Text(
            'Categories',
            style: TextStyle(
              color: ColorConstraint.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: Responsiveness.text(16),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: sampleCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = sampleCategories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: category.color,
                        ),
                        child: Image.asset(category.imageUrl),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.title,
                        style: TextStyle(
                          fontSize: Responsiveness.text(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // --- Sections ---
          SectionWidget(
            title: 'Featured Products',
            products: sampleProducts.sublist(0, 2),
            onFavoriteToggle: () {},
          ),

          SectionWidget(
            title: 'Best Seller',
            products: sampleProducts.sublist(2, 4),
            onFavoriteToggle: () {},
          ),

          // Banner after Best Seller
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              sampleBanners[0],
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SectionWidget(
            title: 'New Arrival',
            products: sampleProducts.sublist(4, 6),
            onFavoriteToggle: () {},
          ),

          // Banner after New Arrival
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              sampleBanners[1],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SectionWidget(
            title: 'Top Rated',
            products: sampleProducts.sublist(2, 4),
            onFavoriteToggle: () {},
          ),

          SectionWidget(
            title: 'Special Offer',
            products: sampleProducts.sublist(2, 4),
            onFavoriteToggle: () {},
          ),

          const SizedBox(height: 20),

          // --- News Section ---
          NewsWidget(),
        ],
      ),
    );
  }
}

// --- Section Widget with title + products row ---
class SectionWidget extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  final VoidCallback? onFavoriteToggle;

  const SectionWidget({
    super.key,
    required this.title,
    required this.products,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: ColorConstraint.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: Responsiveness.text(16),
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: ColorConstraint.buttonColor,
                fontWeight: FontWeight.w400,
                fontSize: Responsiveness.text(14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailPage()),
            );
          },
          child: ProductRowWidget(
            products: products,
            onFavoriteToggle: onFavoriteToggle,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// --- Product Row Widget (2 products per row) ---
class ProductRowWidget extends StatelessWidget {
  final List<ProductModel> products;
  final VoidCallback? onFavoriteToggle;

  const ProductRowWidget({
    super.key,
    required this.products,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox();
    return Row(
      children: [
        Expanded(
          child: CustomProductCard(
            product: products[0],
            onFavoriteToggle: onFavoriteToggle,
          ),
        ),
        const SizedBox(width: 8),
        if (products.length > 1)
          Expanded(
            child: CustomProductCard(
              product: products[1],
              onFavoriteToggle: onFavoriteToggle,
            ),
          )
        else
          Expanded(child: Container()),
      ],
    );
  }
}

// --- News Widget (demo) ---
class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest News',
          style: TextStyle(
            color: ColorConstraint.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: Responsiveness.text(16),
          ),
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text('Agar tetap kinclong, bodi motor ten...'),
                  SizedBox(height: 6),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Image
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ), // adjust radius as needed
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text('Agar tetap kinclong, bodi motor ten...'),
                  SizedBox(height: 6),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Image
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ), // adjust radius as needed
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 30,
                ),
              ),
            ),
          ],
        ),

        const Divider(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text('Agar tetap kinclong, bodi motor ten...'),
                  SizedBox(height: 6),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Image
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ), // adjust radius as needed
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 30,
                ),
              ),
            ),
          ],
        ),

        const Divider(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text('Agar tetap kinclong, bodi motor ten...'),
                  SizedBox(height: 6),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Image
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ), // adjust radius as needed
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 20),
      ],
    );
  }
}
