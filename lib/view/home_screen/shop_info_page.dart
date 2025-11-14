import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/models/product_model.dart';
import 'package:hackathon_isra/models/shop_model.dart';
import 'package:hackathon_isra/routes/routes.dart';
import 'package:hackathon_isra/widgets/custom_product_card.dart';

class ShopInfoScreen extends StatelessWidget {
  final ShopModel shop;
  final List<ProductModel> products;

  const ShopInfoScreen({super.key, required this.shop, required this.products});

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
            _buildShopHeader(context),
            _buildShopStats(context),
            Divider(height: Responsiveness.height(2)),
            _buildShippingSupport(context),
            Divider(height: Responsiveness.height(2)),
            _buildProductsGrid(context),
            SizedBox(height: Responsiveness.height(10)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(context),
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
        'Info Seller',
        style: TextStyle(
          color: ColorConstraint.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: Responsiveness.text(18),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
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

  Widget _buildShopHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsiveness.width(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: Responsiveness.width(12),
            backgroundColor: Colors.grey.shade300,
            backgroundImage: shop.profileImageUrl != null
                ? AssetImage(shop.profileImageUrl!)
                : null,
            child: shop.profileImageUrl == null
                ? Icon(
                    Icons.store,
                    size: Responsiveness.text(24),
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
                    Expanded(
                      child: Text(
                        shop.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Responsiveness.text(18),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    if (shop.rating != null) ...[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: Responsiveness.text(18),
                      ),
                      SizedBox(width: Responsiveness.width(1)),
                      Text(
                        shop.rating!.toStringAsFixed(1),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Responsiveness.text(16),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: Responsiveness.height(0.5)),
                Row(
                  children: [
                    if (shop.type != null) ...[
                      Text(
                        shop.type!,
                        style: TextStyle(
                          fontSize: Responsiveness.text(12),
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: Responsiveness.width(1)),
                    ],
                    if (shop.isVerified)
                      Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: Responsiveness.text(16),
                      ),
                  ],
                ),
                if (shop.location != null || shop.operatingHours != null) ...[
                  SizedBox(height: Responsiveness.height(1)),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: Responsiveness.text(14),
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: Responsiveness.width(1)),
                      Expanded(
                        child: Text(
                          shop.location != null && shop.operatingHours != null
                              ? '${shop.location!} (Jam Buka ${shop.operatingHours!})'
                              : shop.location ?? '',
                          style: TextStyle(
                            fontSize: Responsiveness.text(12),
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShopStats(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsiveness.width(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Pengikut', shop.formattedFollowers),
          _buildStatItem('Produk', '${shop.productCount ?? 0} Item'),
          _buildStatItem('Bergabung', shop.formattedJoinedDate),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: Responsiveness.text(12),
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: Responsiveness.height(0.5)),
        Text(
          value,
          style: TextStyle(
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildShippingSupport(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsiveness.width(4),
        vertical: Responsiveness.height(1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dukungan Pengiriman',
            style: TextStyle(
              fontSize: Responsiveness.text(14),
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: Responsiveness.text(14),
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsiveness.width(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products',
            style: TextStyle(
              fontSize: Responsiveness.text(16),
              fontWeight: FontWeight.bold,
              color: ColorConstraint.primaryColor,
            ),
          ),
          SizedBox(height: Responsiveness.height(2)),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Responsiveness.width(2),
              mainAxisSpacing: Responsiveness.height(2),
              childAspectRatio: 0.5,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return CustomProductCard(
                product: product,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.productDetail,
                    arguments: product,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsiveness.width(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                  padding: EdgeInsets.symmetric(
                    vertical: Responsiveness.height(1.5),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Responsiveness.width(2),
                    ),
                  ),
                ),
                child: Text(
                  'Sorting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Responsiveness.text(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: Responsiveness.width(3)),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstraint.buttonColor,
                  padding: EdgeInsets.symmetric(
                    vertical: Responsiveness.height(1.5),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Responsiveness.width(2),
                    ),
                  ),
                ),
                child: Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Responsiveness.text(14),
                    fontWeight: FontWeight.w500,
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
