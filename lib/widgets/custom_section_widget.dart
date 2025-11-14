import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/models/product_model.dart';
import 'package:hackathon_isra/view/home_screen/product_detail_page.dart';
import 'package:hackathon_isra/widgets/custom_product_card.dart';

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
        // Header Row
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

        // Product Row (2 items)
        Row(
          children: [
            Expanded(
              child: CustomProductCard(
                product: products[0],
                onFavoriteToggle: onFavoriteToggle,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: products[0]),
                    ),
                  );
                },
              ),
            ),
            if (products.length > 1) ...[
              SizedBox(width: Responsiveness.width(2)),
              Expanded(
                child: CustomProductCard(
                  product: products[1],
                  onFavoriteToggle: onFavoriteToggle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: products[1]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
