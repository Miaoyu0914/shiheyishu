import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_album_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineAlbumListController extends ViewStateController {
  MineAlbumListEntity? mineAlbumListEntity;
  List<Data> albums = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getMineAlbumList();
    setIdle();
  }

  Future<void> getMineAlbumList() async {
    mineAlbumListEntity = await NFTService.getMineAlbum(HttpRunnerParams());
    albums.addAll(mineAlbumListEntity!.data!);
    if (mineAlbumListEntity!.data!.length < Constant.refreshListLimit) {
      isNotEnough = true;
    }
  }

  int page = 1;
  bool isNotEnough = false;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void refreshList() async {
    albums.clear();
    page = 1;
    isNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getMineAlbumList();
    refreshController.refreshCompleted();
    if (isNotEnough) {
      refreshController.loadNoData();
    }
  }

  void loadMoreList() async {
    page++;
    await getMineAlbumList();
    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }
}
