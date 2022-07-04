import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_nft_detail_controller.dart';

class MineNFTDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineNFTDetailController(id: Get.arguments['id']));
  }
}