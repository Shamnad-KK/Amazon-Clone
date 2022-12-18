import 'package:amazon_clone/view/admin/add_product_screen/add_product_screen.dart';
import 'package:amazon_clone/view/admin/admin_home_screen/admin_home_screen.dart';
import 'package:amazon_clone/view/admin/widgets/admin_bottom_navbar.dart';
import 'package:amazon_clone/view/user/widgets/bottom_navbar.dart';
import 'package:amazon_clone/routes/route_names.dart';
import 'package:amazon_clone/view/auth/auth_screen.dart';
import 'package:amazon_clone/view/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static getAppRoutes() => [
        GetPage(
            name: RouteNames.splashScreen, page: () => const SplashScreen()),
        GetPage(name: RouteNames.authScreen, page: () => const AuthScreen()),
        GetPage(
            name: RouteNames.bottomNavBar, page: () => const BottomNavBar()),
        GetPage(
            name: RouteNames.adminBottomNavBar,
            page: () => const AdminBottomNavBar()),
        GetPage(
            name: RouteNames.addProductScreen,
            page: () => const AddProductScreen()),
      ];
}
