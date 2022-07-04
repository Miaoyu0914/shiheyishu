import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_nft_list_controller.dart';

class MineNFTListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineNFTListController(id: Get.arguments['id']));
  }
}