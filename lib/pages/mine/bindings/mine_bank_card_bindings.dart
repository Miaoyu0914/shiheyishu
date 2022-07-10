import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_bank_card_controller.dart';

class MineBankCardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineBankCardController());
  }
}