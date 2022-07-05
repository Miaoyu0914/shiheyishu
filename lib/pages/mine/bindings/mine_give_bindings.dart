import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_give_controller.dart';

class MineGiveBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineGiveController());
  }
}