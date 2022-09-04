import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/charge_controller.dart';

class ChargeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChargeController());
  }
}