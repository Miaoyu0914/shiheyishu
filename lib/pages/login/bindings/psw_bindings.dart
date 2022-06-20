import 'package:get/get.dart';
import 'package:shiheyishu/pages/login/controllers/psw_controller.dart';

class ForgetPswBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPswController());
  }
}