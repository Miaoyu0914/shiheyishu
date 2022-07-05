import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_platform_order_controller.dart';

class MinePlatformOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MinePlatformOrderController());
  }
}