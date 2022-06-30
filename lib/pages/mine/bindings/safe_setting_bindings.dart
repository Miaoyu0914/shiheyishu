import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/safe_setting_controller.dart';

class SafeSettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SafeSettingController());
  }
}