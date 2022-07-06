import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/three_controller.dart';

class ThreeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThreeController());
  }
}