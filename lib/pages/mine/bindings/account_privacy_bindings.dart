import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/account_privacy_controller.dart';

class AccountPrivacyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountPrivacyController());
  }
}