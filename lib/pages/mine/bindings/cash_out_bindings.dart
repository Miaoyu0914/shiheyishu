import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/cash_out_controller.dart';

class CashOutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashOutController());
  }
}