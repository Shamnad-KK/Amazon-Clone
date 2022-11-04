import 'package:amazon_clone/controller/auth_controller.dart';
import 'package:get/get.dart';

class InitDependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
