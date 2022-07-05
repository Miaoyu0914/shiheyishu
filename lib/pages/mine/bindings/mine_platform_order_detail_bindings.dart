import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_platform_order_detail_controller.dart';

class MinePlatformOrderDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MinePlatformOrderDetailController(id: Get.arguments['id']));
  }
}