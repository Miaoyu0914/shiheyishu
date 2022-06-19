import 'package:get/get.dart';
import 'package:shiheyishu/pages/login/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}