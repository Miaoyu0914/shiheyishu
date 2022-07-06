import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_blind_box_detail_controller.dart';

class MineBlindBoxDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineBlindBoxDetailController(blindBox: Get.arguments['blindBox'], isOpen: Get.arguments['isOpen']));
  }
}