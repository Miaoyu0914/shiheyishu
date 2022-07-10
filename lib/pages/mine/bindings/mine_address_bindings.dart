import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_address_controller.dart';

class MineAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineAddressController());
  }
}