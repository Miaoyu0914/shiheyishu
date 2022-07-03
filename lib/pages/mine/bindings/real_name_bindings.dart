import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/real_name_controller.dart';

class RealNameBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RealNameController());
  }
}