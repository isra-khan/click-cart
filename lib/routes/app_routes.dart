import 'package:flutter/material.dart';
import 'package:hackathon_isra/models/product_model.dart';
import 'package:hackathon_isra/models/shop_model.dart';
import 'package:hackathon_isra/view/authentication/login_screen.dart';
import 'package:hackathon_isra/view/authentication/profile_password_screen.dart';
import 'package:hackathon_isra/view/authentication/register_screen.dart';
import 'package:hackathon_isra/view/authentication/reset_password_screen.dart';
import 'package:hackathon_isra/view/authentication/update_password_screen.dart';
import 'package:hackathon_isra/view/authentication/verification_register_screen.dart';
import 'package:hackathon_isra/view/authentication/verification_screen.dart';
import 'package:hackathon_isra/view/home_screen/home_screen.dart';
import 'package:hackathon_isra/view/home_screen/product_detail_screen.dart';
import 'package:hackathon_isra/view/home_screen/shop_info_page.dart';
import 'package:hackathon_isra/view/main_navigation.dart';
import 'package:hackathon_isra/view/order/order_screen.dart';
import 'package:hackathon_isra/view/wishlist/wishlist_screen.dart';

class AppRoutes {
  // Route names
  static const String login = '/login';
  static const String register = '/register';
  static const String resetPassword = '/reset-password';
  static const String verification = '/verification';
  static const String verificationRegister = '/verification-register';
  static const String updatePassword = '/update-password';
  static const String profilePassword = '/profile-password';
  static const String mainNavigation = '/main-navigation';
  static const String home = '/home';
  static const String wishlist = '/wishlist';
  static const String order = '/order';
  static const String productDetail = '/product-detail';
  static const String shopInfo = '/shop-info';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case verification:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      case verificationRegister:
        return MaterialPageRoute(
          builder: (_) => const VerificationRegisterScreen(),
        );

      case updatePassword:
        return MaterialPageRoute(builder: (_) => const UpdatePasswordScreen());

      case profilePassword:
        return MaterialPageRoute(builder: (_) => const ProfilePasswordScreen());

      case mainNavigation:
        return MaterialPageRoute(builder: (_) => const MainNavigation());

      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case wishlist:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());

      case order:
        return MaterialPageRoute(builder: (_) => const OrderScreen());

      case productDetail:
        return MaterialPageRoute(
          builder: (_) => args is ProductModel
              ? ProductDetailScreen(product: args)
              : ProductDetailScreen(
                  product: ProductModel(
                    id: '',
                    name: '',
                    brand: '',
                    imageUrl: '',
                    price: 0,
                  ),
                ),
        );

      case shopInfo:
        return MaterialPageRoute(
          builder: (_) {
            if (args is Map<String, dynamic>) {
              return ShopInfoScreen(
                shop: args['shop'] as ShopModel,
                products: args['products'] as List<ProductModel>,
              );
            }
            return ShopInfoScreen(
              shop: ShopModel(id: '', name: ''),
              products: [],
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
