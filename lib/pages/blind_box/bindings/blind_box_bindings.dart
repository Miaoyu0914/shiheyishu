import 'package:get/get.dart';
import 'package:shiheyishu/pages/blind_box/controllers/blind_box_detail_controller.dart';

class BlindBoxDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlindBoxDetailController(id: Get.arguments['id']));
  }
}