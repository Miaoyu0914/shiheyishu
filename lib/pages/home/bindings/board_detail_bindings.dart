import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/controllers/board_detail_controller.dart';

class BoardDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoardDetailController(id: Get.arguments['id']));
  }
}