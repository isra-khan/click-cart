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
import 'package:hackathon_isra/routes/routes.dart';

class AppPages {
  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case AppRoutes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case AppRoutes.verification:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      case AppRoutes.verificationRegister:
        return MaterialPageRoute(
          builder: (_) => const VerificationRegisterScreen(),
        );

      case AppRoutes.updatePassword:
        return MaterialPageRoute(builder: (_) => const UpdatePasswordScreen());

      case AppRoutes.profilePassword:
        return MaterialPageRoute(builder: (_) => const ProfilePasswordScreen());

      case AppRoutes.mainNavigation:
        return MaterialPageRoute(builder: (_) => const MainNavigation());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case AppRoutes.wishlist:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());

      case AppRoutes.order:
        return MaterialPageRoute(builder: (_) => const OrderScreen());

      case AppRoutes.productDetail:
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

      case AppRoutes.shopInfo:
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
