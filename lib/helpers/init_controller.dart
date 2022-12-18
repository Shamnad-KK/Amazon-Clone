import 'package:amazon_clone/controller/admin/add_product_controller.dart';
import 'package:amazon_clone/controller/admin/admin_bottomnav_controller.dart';
import 'package:amazon_clone/controller/auth_controller.dart';
import 'package:amazon_clone/controller/user/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitDependencies extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => BottomNavController(), fenix: true);
    Get.lazyPut(() => AdminBottomNavController(), fenix: true);
    Get.lazyPut(() => AddProductController(), fenix: true);
  }
}
