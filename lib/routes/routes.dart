import 'package:amazon_clone/routes/route_names.dart';
import 'package:amazon_clone/view/auth/auth_screen.dart';
import 'package:amazon_clone/view/home/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static getAppRoutes() => [
        GetPage(name: RouteNames.authScreen, page: () => const AuthScreen()),
        GetPage(name: RouteNames.homeScreen, page: () => const HomeScreen()),
      ];
}
