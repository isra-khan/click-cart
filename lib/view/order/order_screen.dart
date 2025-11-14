import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsiveness.init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: Responsiveness.text(64),
              color: Colors.grey.shade400,
            ),
            SizedBox(height: Responsiveness.height(2)),
            Text(
              'Orders',
              style: TextStyle(
                fontSize: Responsiveness.text(24),
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: Responsiveness.height(1)),
            Text(
              'Your orders will appear here',
              style: TextStyle(
                fontSize: Responsiveness.text(14),
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

