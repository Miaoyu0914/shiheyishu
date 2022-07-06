import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/give_controller.dart';

class GiveBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GiveController(id: Get.arguments['id']));
  }
}