import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_blind_box_list_controller.dart';

class MineBlindBoxListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineBlindBoxListController());
  }
}