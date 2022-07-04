import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_album_list_controller.dart';

class MineAlbumListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineAlbumListController());
  }
}