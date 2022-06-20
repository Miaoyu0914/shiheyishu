import 'package:get/get.dart';
import 'package:shiheyishu/pages/login/controllers/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}