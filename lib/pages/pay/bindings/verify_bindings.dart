import 'package:get/get.dart';
import 'package:shiheyishu/pages/pay/controllers/verify_controller.dart';

class VerifyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyController());
  }
}