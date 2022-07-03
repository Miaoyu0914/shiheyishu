import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/synthesis_list_controller.dart';

class SynthesisListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SynthesisListController());
  }
}