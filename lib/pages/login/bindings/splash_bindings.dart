import 'package:get/get.dart';
import 'package:shiheyishu/pages/login/controllers/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}