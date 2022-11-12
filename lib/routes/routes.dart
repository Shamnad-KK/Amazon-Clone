import 'package:amazon_clone/view/widgets/bottom_navbar.dart';
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
      ];
}
