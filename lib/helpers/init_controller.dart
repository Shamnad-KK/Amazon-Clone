import 'package:amazon_clone/controller/auth_controller.dart';
import 'package:amazon_clone/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitDependencies extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => BottomNavController(), fenix: true);
  }
}
