import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_group_list_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineAlbumListController extends ViewStateController {
  List<MineGroupListEntity>? groupList;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getMineAlbumList();
    setIdle();
  }

  Future<void> getMineAlbumList() async {
    groupList = await NFTService.getGroupList(HttpRunnerParams());
  }

  void pushToGoodsPage(int index) {
    Get.toNamed(Routes.NAV + Routes.MINEALBUMLIST + Routes.MINENFTLIST, arguments: {'id': groupList![index].goodsName});
  }
}
