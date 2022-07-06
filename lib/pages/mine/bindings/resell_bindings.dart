import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/resell_controller.dart';

class RESellBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RESellController(id: Get.arguments['id'], image: Get.arguments['image'], name: Get.arguments['name'], hash: Get.arguments['hash']));
  }
}