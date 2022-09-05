import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_info_change_controller.dart';

class MineInfoChangeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineInfoChangeController());
  }
}