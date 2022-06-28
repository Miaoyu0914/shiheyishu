import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/controllers/board_controller.dart';

class BoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoardController());
  }
}