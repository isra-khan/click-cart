import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/routes/app_routes.dart';
import 'package:hackathon_isra/view/home_screen/home_screen.dart';
import 'package:hackathon_isra/view/order/order_screen.dart';
import 'package:hackathon_isra/view/wishlist/wishlist_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const WishlistScreen(),
    const OrderScreen(),
    const SizedBox.shrink(), // Login will navigate away
  ];

  @override
  Widget build(BuildContext context) {
    Responsiveness.init(context);

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index == 3) {
          // Navigate to login screen
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: ColorConstraint.buttonColor,
      unselectedItemColor: Colors.grey.shade600,
      selectedLabelStyle: TextStyle(
        fontSize: Responsiveness.text(12),
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: Responsiveness.text(12),
        fontWeight: FontWeight.w400,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: Responsiveness.text(24)),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: Responsiveness.text(24)),
          label: 'WISHLIST',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined, size: Responsiveness.text(24)),
          label: 'ORDER',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: Responsiveness.text(24)),
          label: 'LOGIN',
        ),
      ],
    );
  }
}

