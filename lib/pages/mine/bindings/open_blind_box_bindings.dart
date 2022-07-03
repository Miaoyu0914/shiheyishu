import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/open_blind_box_controller.dart';

class OpenBlindBoxBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenBlindBoxController());
  }
}