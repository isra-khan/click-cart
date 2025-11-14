import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/models/category_model.dart';
import 'package:hackathon_isra/models/product_model.dart';
import 'package:hackathon_isra/widgets/custom_product_card.dart';
import 'package:hackathon_isra/widgets/custom_searchbar.dart';
import 'package:hackathon_isra/routes/routes.dart';

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
      id: 'p1',
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 4444.5,
      discount: 0.1,
      imageUrl: 'assets/images/product1.png',
      isFavorite: false,
      rating: 4.6,
      reviewCount: 86,
      stockQuantity: 250,
      shopId: 's1',
    ),
    ProductModel(
      id: 'p2',
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 555.2,
      discount: 0,
      imageUrl: 'assets/images/product2.png',
      isFavorite: true,
      rating: 4.8,
      reviewCount: 120,
      stockQuantity: 150,
      shopId: 's1',
    ),
    ProductModel(
      id: 'p3',
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 455.0,
      discount: 0.2,
      imageUrl: 'assets/images/product2.png',
      isFavorite: false,
      rating: 4.5,
      reviewCount: 45,
      stockQuantity: 80,
      shopId: 's1',
    ),
    ProductModel(
      id: 'p4',
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 454545.0,
      discount: 0,
      imageUrl: 'assets/images/product2.png',
      isFavorite: false,
      rating: 4.7,
      reviewCount: 200,
      stockQuantity: 300,
      shopId: 's1',
    ),
    ProductModel(
      id: 'p5',
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 4555.0,
      discount: 0.05,
      imageUrl: 'assets/images/product2.png',
      isFavorite: true,
      rating: 4.9,
      reviewCount: 95,
      stockQuantity: 180,
      shopId: 's1',
    ),
    ProductModel(
      id: 'p6',
      name: 'TMA-2 HD Wireless',
      brand: '',
      price: 4555.0,
      discount: 0,
      imageUrl: 'assets/images/product2.png',
      isFavorite: false,
      rating: 4.4,
      reviewCount: 67,
      stockQuantity: 100,
      shopId: 's1',
    ),
  ];

  final List<String> sampleBanners = [
    'assets/images/banner3.png',
    'assets/images/banner4.png',
  ];

  // ---------------------------------------------------------------------------
  // --------------------------  BUILD METHOD  ---------------------------------
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    Responsiveness.init(context);

    return Scaffold(
      backgroundColor: ColorConstraint.backgroundColor,
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.all(Responsiveness.width(4)),
        children: [
          _buildSearchBar(),
          SizedBox(height: Responsiveness.height(2.5)),
          _buildCarousel(),
          SizedBox(height: Responsiveness.height(2.5)),
          _buildCategorySection(),
          SizedBox(height: Responsiveness.height(2.5)),
          _buildSection(
            context,
            'Featured Products',
            sampleProducts.sublist(0, 2),
          ),
          _buildSection(context, 'Best Seller', sampleProducts.sublist(2, 4)),
          _buildBanner(sampleBanners[0], Responsiveness.height(25)),
          _buildSection(context, 'New Arrival', sampleProducts.sublist(4, 6)),
          _buildBanner(sampleBanners[1], Responsiveness.height(22.5)),
          _buildSection(context, 'Top Rated', sampleProducts.sublist(2, 4)),
          _buildSection(context, 'Special Offer', sampleProducts.sublist(2, 4)),
          SizedBox(height: Responsiveness.height(2.5)),
          _buildNewsWidget(),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // --------------------------  WIDGET METHODS  -------------------------------
  // ---------------------------------------------------------------------------

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsets.only(right: Responsiveness.width(4)),
      centerTitle: true,
      backgroundColor: ColorConstraint.backgroundColor,
      title: Text(
        'Mega Mall',
        style: TextStyle(
          color: ColorConstraint.buttonColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: const [
        Icon(Icons.notifications_outlined),
        Icon(Icons.shopping_cart_outlined),
      ],
    );
  }

  Widget _buildSearchBar() {
    return CustomSearchBar(controller: controller, onChanged: (val) {});
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: Responsiveness.height(25),
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: imgList.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(Responsiveness.width(3)),
          child: Image.asset(item, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            color: ColorConstraint.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: Responsiveness.text(16),
          ),
        ),
        SizedBox(height: Responsiveness.height(1)),
        SizedBox(
          height: Responsiveness.height(15),
          child: ListView.builder(
            itemCount: sampleCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = sampleCategories[index];
              return Padding(
                padding: EdgeInsets.only(right: Responsiveness.width(3)),
                child: Column(
                  children: [
                    Container(
                      height: Responsiveness.width(20),
                      width: Responsiveness.width(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Responsiveness.width(3.5),
                        ),
                        color: category.color,
                      ),
                      child: Image.asset(category.imageUrl),
                    ),
                    SizedBox(height: Responsiveness.height(1)),
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
      ],
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<ProductModel> products,
  ) {
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
        SizedBox(height: Responsiveness.height(1)),
        Row(
          children: [
            Expanded(
              child: CustomProductCard(
                product: products[0],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.productDetail,
                    arguments: products[0],
                  );
                },
              ),
            ),
            SizedBox(width: Responsiveness.width(2)),
            Expanded(
              child: CustomProductCard(
                product: products.length > 1 ? products[1] : products[0],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.productDetail,
                    arguments: products.length > 1 ? products[1] : products[0],
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: Responsiveness.height(2)),
      ],
    );
  }

  Widget _buildBanner(String image, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Responsiveness.height(1)),
      child: Image.asset(
        image,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildNewsWidget() {
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
        SizedBox(height: Responsiveness.height(2.5)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsiveness.text(14),
                    ),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    'Agar tetap kinclong, bodi motor ten...',
                    style: TextStyle(fontSize: Responsiveness.text(12)),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Responsiveness.text(12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: Responsiveness.width(2)),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Responsiveness.width(5)),
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                  height: Responsiveness.height(10),
                  width: Responsiveness.width(7.5),
                ),
              ),
            ),
          ],
        ),
        Divider(height: Responsiveness.height(2.5)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsiveness.text(14),
                    ),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    'Agar tetap kinclong, bodi motor ten...',
                    style: TextStyle(fontSize: Responsiveness.text(12)),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Responsiveness.text(12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: Responsiveness.width(2)),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Responsiveness.width(5)),
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                  height: Responsiveness.height(10),
                  width: Responsiveness.width(7.5),
                ),
              ),
            ),
          ],
        ),
        Divider(height: Responsiveness.height(2.5)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsiveness.text(14),
                    ),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    'Agar tetap kinclong, bodi motor ten...',
                    style: TextStyle(fontSize: Responsiveness.text(12)),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Responsiveness.text(12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: Responsiveness.width(2)),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Responsiveness.width(5)),
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.cover,
                  height: Responsiveness.height(10),
                  width: Responsiveness.width(7.5),
                ),
              ),
            ),
          ],
        ),
        Divider(height: Responsiveness.height(2.5)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Philosophy That Addresses Topics Such As Goodness',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsiveness.text(14),
                    ),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    'Agar tetap kinclong, bodi motor ten...',
                    style: TextStyle(fontSize: Responsiveness.text(12)),
                  ),
                  SizedBox(height: Responsiveness.height(0.75)),
                  Text(
                    '13 Jan 2021',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Responsiveness.text(12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: Responsiveness.width(2)),
          ],
        ),
      ],
    );
  }
}
