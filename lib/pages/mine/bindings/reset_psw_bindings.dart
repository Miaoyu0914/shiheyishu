import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/reset_psw_controller.dart';

class ResetPswBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPswController(isLoginPsw: Get.arguments['isLoginPsw']));
  }
}