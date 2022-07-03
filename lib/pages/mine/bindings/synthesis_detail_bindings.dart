import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/synthesis_detail_controller.dart';

class SynthesisDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SynthesisDetailController(synthesisListEntity: Get.arguments['entity']));
  }
}