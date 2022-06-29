import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/controllers/nft_detail_controller.dart';

class NFTDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NFTDetailController(id: Get.arguments['id']));
  }
}