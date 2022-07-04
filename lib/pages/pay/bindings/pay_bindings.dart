import 'package:get/get.dart';
import 'package:shiheyishu/pages/pay/controllers/pay_controller.dart';

class PayBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayController(
        orderSn: Get.arguments['orderSn'],
        payType: Get.arguments['payType'],
        entity: Get.arguments['entity']));
  }
}
