import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_open_blind_box_controller.dart';

class MineOpenBlindBoxBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineOpenBlindBoxController(blindBox: Get.arguments['blind_box']));
  }
}