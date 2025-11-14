import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/models/product_model.dart';
import 'package:hackathon_isra/models/shop_model.dart';
import 'package:hackathon_isra/view/home_screen/shop_info_page.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Responsiveness.init(context);

    return Scaffold(
      backgroundColor: ColorConstraint.backgroundColor,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(context),
            _buildProductInfo(context),
            _buildShopInfo(context),
            _buildDescription(context),
            _buildReviewsSection(context),
            SizedBox(height: Responsiveness.height(2)),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
        color: ColorConstraint.primaryColor,
      ),
      centerTitle: true,
      backgroundColor: ColorConstraint.backgroundColor,
      elevation: 0,
      title: Text(
        'Detail Product',
        style: TextStyle(
          color: ColorConstraint.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: Responsiveness.text(18),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {},
          color: ColorConstraint.primaryColor,
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
              color: ColorConstraint.primaryColor,
            ),
            Positioned(
              right: Responsiveness.width(2.5),
              top: Responsiveness.height(1),
              child: Container(
                padding: EdgeInsets.all(Responsiveness.width(0.5)),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(
                  minWidth: Responsiveness.width(4),
                  minHeight: Responsiveness.width(4),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Responsiveness.text(10),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: Responsiveness.width(2)),
      ],
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Responsiveness.height(50),
          color: const Color(0xFFE8F0FE),
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: Responsiveness.height(2),
          left: Responsiveness.width(4),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Responsiveness.width(3),
              vertical: Responsiveness.height(0.5),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(Responsiveness.width(2)),
            ),
            child: Text(
              '1/5 Foto',
              style: TextStyle(
                color: Colors.white,
                fontSize: Responsiveness.text(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsiveness.width(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Responsiveness.text(24),
              color: Colors.black,
            ),
          ),
          SizedBox(height: Responsiveness.height(1)),
          Row(
            children: [
              Text(
                'Rp ${_formatPrice(product.price)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsiveness.text(18),
                  color: Colors.red,
                ),
              ),
              if (product.discount > 0) ...[
                SizedBox(width: Responsiveness.width(2)),
                Text(
                  'Rp ${_formatPrice(product.price / (1 - product.discount))}',
                  style: TextStyle(
                    fontSize: Responsiveness.text(14),
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: Responsiveness.height(1.5)),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: Responsiveness.text(18),
              ),
              SizedBox(width: Responsiveness.width(1)),
              Text(
                '4.6',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsiveness.text(16),
                ),
              ),
              SizedBox(width: Responsiveness.width(2)),
              Text(
                '86 Reviews',
                style: TextStyle(
                  color: ColorConstraint.primaryColor,
                  fontSize: Responsiveness.text(14),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsiveness.width(3),
                  vertical: Responsiveness.height(0.5),
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(Responsiveness.width(2)),
                ),
                child: Text(
                  'Tersedia : 250',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: Responsiveness.text(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShopInfo(BuildContext context) {
    // Create sample shop data - in real app, this would come from API or product.shopId
    final shop = ShopModel(
      id: product.shopId ?? 's1',
      name: 'Shop Larson Electronic',
      isVerified: true,
      type: 'Official Store',
      location: 'Jawa Barat, Bandung',
      operatingHours: '08:00-21:00',
      followers: 23000,
      productCount: 150,
      joinedDate: DateTime(2021, 10, 20),
      rating: 4.6,
      profileImageUrl: 'assets/images/product.png',
    );

    // Sample products from the same shop - in real app, fetch by shopId
    // For demo, we'll use the current product and create similar ones
    final shopProducts = [
      product,
      product.copyWith(
        id: '${product.id}_2',
        imageUrl: 'assets/images/product2.png',
      ),
      product.copyWith(
        id: '${product.id}_3',
        imageUrl: 'assets/images/product1.png',
      ),
      product.copyWith(
        id: '${product.id}_4',
        imageUrl: 'assets/images/product2.png',
      ),
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopInfoPage(
              shop: shop,
              products: shopProducts,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Responsiveness.width(4)),
        padding: EdgeInsets.all(Responsiveness.width(4)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Responsiveness.width(3)),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: Responsiveness.width(8),
              backgroundColor: Colors.grey.shade300,
              backgroundImage: shop.profileImageUrl != null
                  ? AssetImage(shop.profileImageUrl!)
                  : null,
              child: shop.profileImageUrl == null
                  ? Icon(
                      Icons.person,
                      size: Responsiveness.text(20),
                      color: Colors.grey.shade600,
                    )
                  : null,
            ),
            SizedBox(width: Responsiveness.width(3)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        shop.name,
                        style: TextStyle(
                          color: ColorConstraint.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: Responsiveness.text(16),
                        ),
                      ),
                      SizedBox(width: Responsiveness.width(1)),
                      if (shop.isVerified)
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: Responsiveness.text(16),
                        ),
                    ],
                  ),
                  SizedBox(height: Responsiveness.height(0.5)),
                  if (shop.type != null)
                    Text(
                      shop.type!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: Responsiveness.text(12),
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: Responsiveness.text(16),
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsiveness.width(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Responsiveness.text(18),
              color: ColorConstraint.primaryColor,
            ),
          ),
          SizedBox(height: Responsiveness.height(1.5)),
          Text(
            'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.',
            style: TextStyle(
              fontSize: Responsiveness.text(14),
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
          SizedBox(height: Responsiveness.height(1)),
          Text(
            'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.',
            style: TextStyle(
              fontSize: Responsiveness.text(14),
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsiveness.width(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Review (86)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsiveness.text(18),
                  color: ColorConstraint.primaryColor,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: Responsiveness.text(18),
                  ),
                  SizedBox(width: Responsiveness.width(1)),
                  Text(
                    '4.6',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsiveness.text(16),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: Responsiveness.height(2)),
          _buildReviewItem(
            context,
            'Yelena Belova',
            'assets/images/product.png',
            5,
            '2 Minggu yang lalu',
            'Lorem ipsum',
          ),
          Divider(height: Responsiveness.height(3)),
          _buildReviewItem(
            context,
            'Stephen Strange',
            'assets/images/product.png',
            3,
            '1 Bulan yang lalu',
            'Lorem ipsum',
          ),
          Divider(height: Responsiveness.height(3)),
          _buildReviewItem(
            context,
            'Peter Parker',
            'assets/images/product.png',
            4,
            '2 Bulan yang lalu',
            'Lorem ipsum',
          ),
          SizedBox(height: Responsiveness.height(2)),
          Center(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Responsiveness.width(8),
                  vertical: Responsiveness.height(1.5),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Responsiveness.width(2)),
                ),
              ),
              child: Text(
                'See All Review',
                style: TextStyle(
                  color: ColorConstraint.primaryColor,
                  fontSize: Responsiveness.text(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(
    BuildContext context,
    String name,
    String imagePath,
    int rating,
    String timeAgo,
    String reviewText,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: Responsiveness.width(6),
          backgroundColor: Colors.grey.shade300,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(width: Responsiveness.width(3)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsiveness.text(14),
                    ),
                  ),
                  SizedBox(width: Responsiveness.width(2)),
                  ...List.generate(
                    5,
                    (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: Responsiveness.text(14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Responsiveness.height(0.5)),
              Text(
                timeAgo,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: Responsiveness.text(12),
                ),
              ),
              SizedBox(height: Responsiveness.height(1)),
              Text(
                reviewText,
                style: TextStyle(
                  fontSize: Responsiveness.text(14),
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatPrice(double price) {
    final priceString = price.toStringAsFixed(0);
    final buffer = StringBuffer();
    for (int i = 0; i < priceString.length; i++) {
      if (i > 0 && (priceString.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(priceString[i]);
    }
    return buffer.toString();
  }
}
