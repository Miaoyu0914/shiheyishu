import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/public_pool_controller.dart';

class PublicPoolBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublicPoolController());
  }
}